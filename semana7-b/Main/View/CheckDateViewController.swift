import UIKit

class CheckDateViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    func setUpView(){
        closeButton.setImage(UIImage(named: "cancel"), for: .normal)
        closeButton.setTitle("", for: .normal)
        
    }
    
    
    @IBAction func onClickClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClickCalendar(_ sender: Any) {
        print(datePicker.date)
        //format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        lblDate.text = dateFormatter.string(from: datePicker.date)
    }
}
