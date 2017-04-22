//
//  Movie.swift
//  MovieLibrary
//
//  Created by ios on 4/22/17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

import Foundation
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
