import UIKit

class AlertViewController: BaseAlertViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    var completionHandler: ((Bool) -> Void)?

    override func viewDidLoad() {
    }

    @IBAction func submit(_ sender: Any) {
        dismiss(animated: false) {
            self.completionHandler?(true)
        }
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true) {
            self.completionHandler?(false)
        }
    }
}

extension UIViewController {
    func presentHorizontalConfirmationAlert(
        presentCompletionHandler: @escaping (AlertViewController) -> Void,
        completionHandler: ((Bool) -> Void)? = nil) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertView") as! AlertViewController
        controller.modalPresentationStyle = .overFullScreen
        controller.completionHandler = completionHandler
        present(controller, animated: false) {
            presentCompletionHandler(controller)
        }
        
    }
}


class BaseAlertViewController: UIViewController {
    @IBOutlet weak var alertBox: UIVisualEffectView!

    override func viewDidAppear(_ animated: Bool) {
        alertBox.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        UIView.animate(withDuration: 0.3) {
            self.alertBox.alpha = 1
            self.alertBox.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }

    override func dismiss(animated : Bool, completion: (() -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.alpha = 0
            }) {
                finished in
                super.dismiss(animated: false, completion: completion)
            }
        } else {
            super.dismiss(animated: false, completion: completion)
        }
    }
}
