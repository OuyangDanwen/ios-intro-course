//
//  ViewController.swift
//  MovieLibrary
//
//  Created by ios on 4/22/17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var movieArray = [Movie]()
    private var currentMovie = 0
    
    private let m1 = Movie.init(poster: UIImage(named: "spiderman")!, title:"Spiderman", description: "Spider-Man is a 2002 American superhero film directed by Sam Raimi.The film stars Tobey Maguire as Peter Parker, who turns to crimefighting after developing spider-like super powers. ")
    private let m2 = Movie.init(poster: UIImage(named: "superman")!, title: "Superman", description: "The film depicts Superman's origin, including his infancy as Kal-El of Krypton and his youthful years in the rural town of Smallville.")
    private let m3 = Movie.init(poster: UIImage(named: "the_dark_knight")!, title: "The Dark Knight", description: "The Dark Knight ist ein US-amerikanisch-britisches Actiondrama und eine Comicverfilmung des Regisseurs Christopher Nolan aus dem Jahr 2008, das auf dem von Bob Kane erschaffenen Batman-Mythos basiert.")
    private let m4 = Movie.init(poster: UIImage(named: "king_kong")!, title: "King Kong", description: "King Kong is a 2005 epic monster adventure film co-written, produced, and directed by Peter Jackson.")
    private let m5 = Movie.init(poster: UIImage(named: "inception")!, title: "Inception", description: "Inception is a 2010 science fiction film written, co-produced, and directed by Christopher Nolan, and co-produced by Emma Thomas.")
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var descriptionField: UITextView!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initializeData()
        updateView()
    }
    
    private func initializeData() {
        movieArray = [m1, m2, m3, m4, m5]
    }
    
    private func updateView() {
        titleLabel.text = movieArray[currentMovie].title
        descriptionField.text = movieArray[currentMovie].description
        imageView.image = movieArray[currentMovie].poster
    }

    @IBAction func nextMovie(_ sender: Any) {
        currentMovie = (currentMovie + 1) % movieArray.count
        updateView()
    }

}
