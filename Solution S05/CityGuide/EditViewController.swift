//
//  File.swift
//  CityGuide
//
//  Created by ios on 4/24/17.
//  Copyright © 2017 TUM LS1. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    //MARK: instance variables
    var cities = [City]()
    var currentIndex = 0
    weak var delegate: SaveGuideDelegate?
    
    //MARK: IBOutlets
    @IBOutlet weak var favouriteStatus: UISwitch!
    @IBOutlet weak var guideTextView: UITextView!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeData()
    }

    //MARK: IBActions
    @IBAction func didPressHideKeyboard(_ sender: UIButton) {
        guideTextView.resignFirstResponder()
    }
    
    @IBAction func didPressSave(_ sender: UIBarButtonItem) {
        if saveGuide() {
            _ = navigationController?.popViewController(
                    animated: true)
        } else {
            let alertController: UIAlertController = UIAlertController(title: "Empty Text", message: "Guide cannot be empty!", preferredStyle: .alert)
            let nextAction = UIAlertAction(title: "Dismiss", style: .default) {
                action -> Void in self.viewDidLoad()
            }
            alertController.addAction(nextAction)
            self.present(alertController, animated: true)
        }
    }
  
    @IBAction func markFavourite(_ sender: UISwitch) {
        if cities[currentIndex].favorite {
            cities[currentIndex].favorite = false
        } else {
            cities[currentIndex].favorite = true
        }
    }

    //MARK: private methods
    private func saveGuide() -> Bool {
        if guideTextView.text == "" {
            return false
        } else {
            cities[currentIndex].guide = guideTextView.text
            self.delegate?.saveGuide(cityGuide: cities[currentIndex], cityIndex: currentIndex)
            return true
        }
    }

     private func initializeData() {
        guideTextView.text = cities[currentIndex].guide
        if cities[currentIndex].favorite {
            favouriteStatus.setOn(true, animated: false)
        } else {
            favouriteStatus.setOn(false, animated: false)
        }
    }
}
