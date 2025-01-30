//
//  DishLandscapeCollectionViewCell.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)

    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!

    
    func setup(dish: Dish){
        
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asUrl)
    }

}
