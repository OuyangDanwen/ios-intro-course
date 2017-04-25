import UIKit

class ComposeMailViewController: UIViewController {
    // TODO 4: Using a vertical StackView, add a Recipient field, a subject field and a TextView for the email content
    // TODO 4.1: The recipient field should be grouped next to a "To" label in another StackView. The field should use "EmailTextField" as a custom class, and the label the "SubheaderLabel" class
    // TODO 4.2: Apply the "SubjectTextField" class to the subject field
    // TODO 4.3: Apply the "ContentTextView" class to the TextView
    
    // TODO 5: Add a send button to the right of the navigation bar (using the send image from the assets catalogue)
    // TODO 6: Add a send floating button to the ViewController with the same position and size as in the InboxViewController
    // TODO 7: Both buttons should validate each editable text and display a warning if applicable. If everything is correctly filled out dismissing the ViewController suffices as a "send"
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
        dismiss(animated: true, completion: nil)
    }

    @IBAction func composeButtonPressed(_ sender: FloatingButton) {
        if recepientField.text == "" {
            showAlert(message: "Must specify a recepient!", alert: "No Recepient")
        } else if contentField.text == "" {
            showAlert(message: "Must enter some text as email content!", alert: "Empty Content")
        }
    }
    
    //private methods
    private func showAlert(message: String, alert: String) {
        let alertController: UIAlertController = UIAlertController(title: alert, message: message, preferredStyle: .alert)
        let nextAction = UIAlertAction(title: "Dismiss", style: .default) {
            action -> Void in self.viewDidLoad()
        }
        alertController.addAction(nextAction)
        self.present(alertController, animated: true)
    }
    
}
