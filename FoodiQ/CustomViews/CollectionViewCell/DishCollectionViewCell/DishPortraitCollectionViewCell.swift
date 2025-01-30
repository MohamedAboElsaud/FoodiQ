//
//  DishPortraitCollectionViewCell.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishPortraitCollectionViewCell.self )
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var descritionLbl: UILabel!
    
    
    func setup(dish: Dish){
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descritionLbl.text = dish.description
        
    }

}
