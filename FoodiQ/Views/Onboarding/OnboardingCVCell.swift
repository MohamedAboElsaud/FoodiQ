//
//  OnboardingCVCell.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 26/01/2025.
//

import UIKit

class OnboardingCVCell: UICollectionViewCell {
    static let identifier = String(describing: OnboardingCVCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        
    }
}
