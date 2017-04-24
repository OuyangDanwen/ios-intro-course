import UIKit

class EditViewController: UIViewController {
    
    //MARK: instance variables
    //var cities = [City]()
    var city: City!
    var currentIndex = 0
    weak var delegate: SaveGuideDelegate?
    
    //MARK: IBOutlets
    @IBOutlet var favouriteStatus: UISwitch!
    @IBOutlet var guideTextView: UITextView!
    
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
            showAlert()
        }
    }
  
    @IBAction func markFavourite(_ sender: UISwitch) {
        if city.favorite {
            city.favorite = false
        } else {
            city!.favorite = true
        }
    }

    //MARK: private methods
    private func saveGuide() -> Bool {
        if guideTextView.text == "" {
            return false
        } else {
            city.guide = guideTextView.text
            self.delegate?.saveGuide(cityGuide: city!, cityIndex: currentIndex)
            return true
        }
    }

     private func initializeData() {
        guideTextView.text = city.guide
        if city!.favorite {
            favouriteStatus.setOn(true, animated: false)
        } else {
            favouriteStatus.setOn(false, animated: false)
        }
    }
    
    private func showAlert() {
        let alertController: UIAlertController = UIAlertController(title: "Empty Text", message: "Guide cannot be empty!", preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "Dismiss", style: .default) {
            action -> Void in self.viewDidLoad()
        }
        alertController.addAction(nextAction)
        self.present(alertController, animated: true)
    }
}
