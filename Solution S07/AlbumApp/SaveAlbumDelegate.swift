import UIKit

protocol SaveAlbumDelegate: class {
    /**
     Saves ".artist" propery of an "Album"
     
     - Parameter artist:        the property to be saved
     - Parameter indexPath: the index path where the cell to be updated can be located
     */
    func saveArtist(artist: String, indexPath: IndexPath)
    
    /**
     Saves ".title" propery of an "Album"
    
     - Parameter title:        the property to be saved
     - Parameter indexPath: the index path where the cell to be updated can be located
     */
    func saveTitle(title: String, indexPath: IndexPath)
    
    /**
     Saves ".year" propery of an "Album"
     
     - Parameter year:        the property to be saved
     - Parameter indexPath: the index path where the cell to be updated can be located
     */
    func saveYear(year: String, indexPath: IndexPath)
    
    /**
     Saves ".genre" propery of an "Album"
     
     - Parameter genre:        the property to be saved
     - Parameter indexPath: the index path where the cell to be updated can be located
     */
    func saveGenre(genre: String, indexPath: IndexPath)
}
