//
//  String+Extention.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 26/01/2025.
//

import Foundation

extension String{
    var asUrl:URL?{
        return URL(string: self)
    }
}
