//
//  Dish.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import Foundation
import UIKit
struct Dish: Decodable{
    let id, name, description, image: String?
    let calories: Double?
    
    var formattedCalories: String{
        return String(format: "%.2f Calories", calories ?? 0)
    }
}
