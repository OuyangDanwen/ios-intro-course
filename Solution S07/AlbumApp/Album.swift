struct Album {
    var title: String
    var artist: String
    var genre: String
    var year: String
    let coverImageName: String
    
    init(title: String, artist: String, genre: String, year: String, coverImageName: String) {
        self.title = title
        self.artist = artist
        self.genre = genre
        self.year = year
        self.coverImageName = coverImageName
    }

}
