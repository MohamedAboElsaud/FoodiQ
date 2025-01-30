//
//  CategoryCollectionViewCell.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 26/01/2025.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing:  CategoryCollectionViewCell.self)
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup( category: DishCategory ){
        categoryNameLabel.text = category.title
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }

}
