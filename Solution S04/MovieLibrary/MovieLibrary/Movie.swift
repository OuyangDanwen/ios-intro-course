import UIKit

class Movie {
    let poster: UIImage
    let title: String
    let description: String
    
    init(poster: UIImage, title: String, description: String) {
        self.poster = poster
        self.title = title
        self.description = description
    }
}
