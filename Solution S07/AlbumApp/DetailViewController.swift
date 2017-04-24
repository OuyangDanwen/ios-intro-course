import UIKit

class DetailViewController: UIViewController {
    
    //MARK: instance variables
    var albums = [Album]()
    var indexPath = IndexPath()
    weak var delegate: SaveAlbumDelegate?
    
    //MARK: IBOutlets
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var coverImage: UIImageView!
    
    //MARK: Overides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistField.delegate = self
        titleField.delegate = self
        genreField.delegate = self
        yearField.delegate = self
        
        initializeData()
    }
    
    //MARK: private methods
    private func initializeData() {
        artistField.text = albums[(indexPath.row)].artist
        titleField.text = albums[(indexPath.row)].title
        genreField.text = albums[(indexPath.row)].genre
        yearField.text = String(albums[(indexPath.row)].year)
        self.title = artistField.text! + " Album"
        coverImage.image = UIImage(named: albums[indexPath.row].coverImageName)
    }
}

//MARK: UITextFieldDelegate
extension DetailViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        if textField == artistField {
            delegate?.saveArtist(artist: artistField.text!, indexPath: indexPath)
        } else if textField == titleField {
            delegate?.saveTitle(title: titleField.text!, indexPath: indexPath)
        } else if textField == genreField {
            delegate?.saveGenre(genre: genreField.text!, indexPath: indexPath)
        } else if textField == yearField {
            delegate?.saveYear(year: yearField.text!, indexPath: indexPath)
        }
    }
}
