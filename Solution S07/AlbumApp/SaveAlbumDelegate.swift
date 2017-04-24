import UIKit

protocol SaveAlbumDelegate: class {
    func saveArtist(album: Album, indexPath: IndexPath)
    func saveTitle(album: Album, indexPath: IndexPath)
    func saveYear(album: Album, indexPath: IndexPath)
    func saveGenre(album: Album, indexPath: IndexPath)
}
