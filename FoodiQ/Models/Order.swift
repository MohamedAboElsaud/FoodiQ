//
//  Order.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import Foundation
import UIKit

struct Order: Decodable{
    let id, name: String?
    let dish: Dish?
}
