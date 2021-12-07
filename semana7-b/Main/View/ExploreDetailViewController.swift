//
//  ExploreDetailViewController.swift
//  semana7-b
//
//  Created by Linder Hassinger on 6/10/21.
//

import UIKit
import FirebaseFirestore

class ExploreDetailViewController: UIViewController {

    var name: String? = nil
    var address: String? = nil
    var rating: String? = nil
    var userRatingsTotal: String? = nil
    var photo: String? = nil
    
    @IBOutlet weak var imageBG: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnLiked: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    let db = Firestore.firestore()
    var ref : DocumentReference? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        lblTitle.text = name!
        lblAddress.text = address!
        
        setUpImage(photo: photo!, image: imageBG)
        
        let actionImage = UITapGestureRecognizer(target: self, action: #selector(self.imageClick))
        
        imageBG.addGestureRecognizer(actionImage)
        imageBG.isUserInteractionEnabled = true
        btnLiked.setImage(UIImage(named: "heart"), for: .normal)
        btnLiked.setTitle("", for: .normal)
    }
    
    @objc func imageClick(sender: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
    
    @IBAction func onClickAddWish(_ sender: Any) {
        btnLiked.setImage(UIImage(named: "heart_like"), for: .normal)
        // al darle click a esto se debe agregar a nuestra vista lista de firestore
        // recibe objecto de tipo array dictionary: [String: Any]
        let data: [String : Any] = [
            "name" : name!,
            "address": address!,
            "rating" : rating!,
            "userRatingsTotal" : userRatingsTotal!,
            "photo" : photo!
        ]
        
        db.collection("wishlist").addDocument(data: data){
            err in
            if let err = err {
                print("Error \(err.localizedDescription)")
            } else {
                //creo una alerta de felicidades
                let alert = UIAlertController(title: "Felicidades", message: "Se agregó \(self.name!) a tu lista de deseos.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default){_ in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}
