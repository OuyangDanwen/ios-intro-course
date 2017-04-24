import UIKit

class DetailViewController: UIViewController {
    
    var albums = [Album]()
    var indexPath = IndexPath()
    var album: Album?
    weak var delegate: SaveAlbumDelegate?
    
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistField.delegate = self
        titleField.delegate = self
        genreField.delegate = self
        yearField.delegate = self
        
        initializeData()
    }
    
    private func initializeData() {
        artistField.text = albums[(indexPath.row)].artist
        titleField.text = albums[(indexPath.row)].title
        genreField.text = albums[(indexPath.row)].genre
        yearField.text = String(albums[(indexPath.row)].year)
        self.title = artistField.text! + " Album"
        album = albums[indexPath.row]
    }
}

extension DetailViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        if textField == artistField {
            delegate?.saveTitle(album: album!, indexPath: indexPath)
        } else if textField == titleField {
            delegate?.saveArtist(album: album!, indexPath: indexPath)
        } else if textField == genreField {
            delegate?.saveGenre(album: album!, indexPath: indexPath)
        } else if textField == yearField {
            delegate?.saveYear(album: album!, indexPath: indexPath)
        }
    }
}
