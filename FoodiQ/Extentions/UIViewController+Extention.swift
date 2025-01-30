//
//  UIViewController+Extention.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import Foundation
import UIKit

extension UIViewController{
    
    static var identifier: String{
        return String(describing: Self.self)
        
    }
    
    static func instantiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return  storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
