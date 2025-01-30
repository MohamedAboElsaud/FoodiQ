//
//  CardView.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 26/01/2025.
//

import Foundation
import UIKit
class CardView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
        
    }
}
