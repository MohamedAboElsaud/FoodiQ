//
//  UIView+Extention.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 26/01/2025.
//

import Foundation
import UIKit
extension UIView{
  @IBInspectable  var cornerRadius: CGFloat{
        get{
            return cornerRadius
        }set{
            self.layer.cornerRadius = newValue
        }
    }
}
