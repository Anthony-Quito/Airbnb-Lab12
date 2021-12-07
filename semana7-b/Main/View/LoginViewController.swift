import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        validateSession()
    }
    @IBAction func onClickLogin(_ sender: Any) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        login(email:email, password:password)
    }
    func storeUser (email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){
            authResponse , error in
            
            if error == nil {
                self.goHome()
            }
        }
    }
    func login(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password){
            authResponse, error in
            if error == nil{
                self.goHome()
            }
        }
    }
    func validateSession(){
        if Auth.auth().currentUser != nil{
            self.goHome()
        }
    }
    func goHome(){
        self.performSegue(withIdentifier: "segueLogin", sender: nil)
    }
    
}
