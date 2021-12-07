//
//  Util.swift
//  semana7-b
//
//  Created by MAC05 on 6/12/21.
//

import Foundation
import UIKit

extension UIViewController{
    
    func setUpImage(photo: String, image: UIImageView){
        let urlImage = URL(string: photo)
        
        let data = try? Data(contentsOf: urlImage!)
        
        if let imageData = data {
            image.image = UIImage(data: imageData)
        }
    }
}
