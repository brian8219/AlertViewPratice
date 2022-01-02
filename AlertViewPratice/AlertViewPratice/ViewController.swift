import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showAlert(_ sender: Any) {
        presentHorizontalConfirmationAlert(presentCompletionHandler: {
            controller in
            controller.label.text = "title"
            controller.message.text = "message"
            controller.submitButton.setTitle("ok", for: .normal)
            controller.cancelButton.setTitle("cancel", for: .normal)
        }) {
            success in
            if success {
                print("ok")
            } else {
                print("cancel")
            }
        }
    }
}
