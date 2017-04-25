import UIKit

class ComposeMailViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var recepientField: UITextField!
    @IBOutlet var subjectField: SubjectTextField!
    @IBOutlet var contentField: UITextView!
    
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: IBActions
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIBarButtonItem) {
       validateText()
    }

    @IBAction func floatingSendButtonPressed(_ sender: FloatingButton) {
        validateText()
    }
    
    //private methods
    private func validateText() {
        if recepientField.text == "" {
            showAlert(message: "Must specify a recepient!", alert: "No Recepient")
        } else if contentField.text == "" {
            showAlert(message: "Must enter some text as email content!", alert: "Empty Content")
        }
    }
    
    private func showAlert(message: String, alert: String) {
        let alertController: UIAlertController = UIAlertController(title: alert, message: message, preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "Dismiss", style: .default) {
            action -> Void in self.viewDidLoad()
        }
        alertController.addAction(nextAction)
        self.present(alertController, animated: true)
    }
}
