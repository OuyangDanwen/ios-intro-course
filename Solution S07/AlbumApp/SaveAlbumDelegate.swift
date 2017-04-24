import UIKit

protocol SaveAlbumDelegate: class {
    
    func saveArtist(artist: String, indexPath: IndexPath)
    func saveTitle(title: String, indexPath: IndexPath)
    func saveYear(year: String, indexPath: IndexPath)
    func saveGenre(genre: String, indexPath: IndexPath)
}
