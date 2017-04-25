import UIKit

class LaunchScreenViewController: UIViewController {
    //MARK: instance variables
    fileprivate let segueIdentifierForViewMailVC = "showInboxViewController"
    
    //MARK: IBOutlets
    @IBOutlet var iconImage: UIImageView!
    
    //Overrides
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animate()
        
        //delay the segue for the segue to complete
        let duration = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: duration) {
            self.performSegue(withIdentifier: self.segueIdentifierForViewMailVC, sender: nil)
        }
    }
    
    //MARK: private methods
    private func animate() {
        UIView.animate(withDuration: 1.5, animations: {
            self.iconImage.transform = CGAffineTransform.init(rotationAngle: 90) }){ (true) in UIView.animate(withDuration: 1.5, animations: {
                self.iconImage.transform = CGAffineTransform.init(translationX: 0, y: -200)}, completion: { (true) in })
        }
    }
}
