import UIKit
import FirebaseAuth
class ProfileViewController: UIViewController {
        
    @IBOutlet weak var lblEmail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
        let user = Auth.auth().currentUser
        if let user = user {
            lblEmail.text = user.email
        }
    }
    @IBAction func onClickLogout(_ sender: Any) {
        let auth = Auth.auth()
        do {
            try auth.signOut()
            dismiss(animated: true, completion: nil)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}
