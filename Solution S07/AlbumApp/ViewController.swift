import UIKit

class ViewController: UIViewController {
    
    private let a1 = Album(title: "Hello", artist: "Adele", genre: "pop", year: 2012, coverImageName: "cover1")
    private let a2 = Album(title: "Thrill", artist: "Jackson", genre: "pop", year: 1992, coverImageName: "cover2")
    private let a3 = Album(title: "Hey Jude", artist: "Beatles", genre: "pop", year: 1983, coverImageName: "cover3")
    private let a4 = Album(title: "Love", artist: "Tony", genre: "pop", year: 1999, coverImageName: "cover4")
    private let a5 = Album(title: "Pretty Boy", artist: "Salsa", genre: "pop", year: 2003, coverImageName: "cover5")
    private let a6 = Album(title: "City", artist: "Cranberry", genre: "pop", year: 2008, coverImageName: "cover6")
    
    fileprivate var albums = [Album]()
    fileprivate var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albums = [a1, a2, a3, a4, a5, a6]
    }
    
    @IBOutlet weak var albumTable: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.albums = self.albums
            destination.delegate = self
            destination.indexPath = albumTable.indexPathForSelectedRow!
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        albumTable.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let coverImageName = albums[indexPath.row].coverImageName
        
        cell.textLabel?.text = albums[indexPath.row].title
        cell.detailTextLabel?.text = albums[indexPath.row].artist
        cell.imageView?.image = UIImage(named: coverImageName)
        
        return cell
    }
}

extension ViewController: SaveAlbumDelegate {
    
    func saveTitle(album: Album, indexPath: IndexPath) {
        albums[indexPath.row].title = album.title
    }
    
    func saveYear(album: Album, indexPath: IndexPath) {
        albums[indexPath.row].year = album.year
    }
    
    func saveArtist(album: Album, indexPath: IndexPath) {
        albums[indexPath.row].artist = album.artist
    }
    
    func saveGenre(album: Album, indexPath: IndexPath) {
        albums[indexPath.row].genre = album.genre
    }
}
