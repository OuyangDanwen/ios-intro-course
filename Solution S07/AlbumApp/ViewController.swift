import UIKit

class ViewController: UIViewController {
    
    //MARK: instance variables
    private let a1 = Album(title: "Hello", artist: "Adele", genre: "pop", year: "2012", coverImageName: "cover1")
    private let a2 = Album(title: "Thrill", artist: "Jackson", genre: "pop", year: "1992", coverImageName: "cover2")
    private let a3 = Album(title: "Hey Jude", artist: "Beatles", genre: "pop", year: "1983", coverImageName: "cover3")
    private let a4 = Album(title: "Love", artist: "Tony", genre: "pop", year: "1999", coverImageName: "cover4")
    private let a5 = Album(title: "Pretty Boy", artist: "Salsa", genre: "pop", year: "2003", coverImageName: "cover5")
    private let a6 = Album(title: "City", artist: "Cranberry", genre: "pop", year: "2008", coverImageName: "cover6")
    
    fileprivate var albums = [Album]()
    
    fileprivate let prototypeCellIdentifier = "cell"
    
    //MARK: IBOutlets
    @IBOutlet var albumTable: UITableView!

    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        albums = [a1, a2, a3, a4, a5, a6]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.albums = self.albums
            destination.delegate = self
            if let indexPath = albumTable.indexPathForSelectedRow {
                destination.indexPath = indexPath
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        albumTable.reloadData()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: prototypeCellIdentifier, for: indexPath)
        let coverImageName = albums[indexPath.row].coverImageName
        
        cell.textLabel?.text = albums[indexPath.row].title
        cell.detailTextLabel?.text = albums[indexPath.row].artist
        cell.imageView?.image = UIImage(named: coverImageName)
        
        return cell
    }
}

//MARK: SaveAlbumDelegate
extension ViewController: SaveAlbumDelegate {
    
    func saveTitle(title: String, indexPath: IndexPath) {
        self.albums[indexPath.row].title = title
    }
    
    func saveYear(year: String, indexPath: IndexPath) {
        self.albums[indexPath.row].year = year
    }
    
    func saveArtist(artist: String, indexPath: IndexPath) {
        self.albums[indexPath.row].artist = artist
        print(artist)
    }
    
    func saveGenre(genre: String, indexPath: IndexPath) {
        self.albums[indexPath.row].genre = genre
    }
}
