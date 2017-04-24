//
//  Album.swift
//  AlbumApp
//
//  Created by ios on 4/24/17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

class Album {
    var title: String
    var artist: String
    var genre: String
    var year: Int
    let coverImageName: String
    
    init(title: String, artist: String, genre: String, year: Int, coverImageName: String) {
        self.title = title
        self.artist = artist
        self.genre = genre
        self.year = year
        self.coverImageName = coverImageName
    }

}
