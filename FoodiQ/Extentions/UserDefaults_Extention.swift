//
//  UserDefaults_Extention.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 28/01/2025.
//

import Foundation

extension UserDefaults{
    private enum UserDefaultsKeys: String{
        case hasOnboarded
    }
    
    var hasOnboarded: Bool{
        get{
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
