//
//  HeartButton.swift
//  semana7-b
//
//  Created by MAC05 on 4/12/21.
//

import Foundation
import UIKit

class HearButton: UIButton{
    
    private let unlikedImage = UIImage(named: "heart")
    private let liked = UIImage(named: "heart_like")
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        
        setImage(unlikedImage, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: \(coder) no puede ser implementado" )
    }
    
}
