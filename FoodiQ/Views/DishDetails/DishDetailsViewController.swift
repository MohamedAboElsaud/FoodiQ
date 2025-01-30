//
//  DishDetailsViewController.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import UIKit
import ProgressHUD
class DishDetailsViewController: UIViewController {

    var dish:Dish!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
    }
    private func populateView(){
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asUrl)
    }
    
    @IBAction func placeOrderClickedBtn(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),!name.isEmpty else{
            ProgressHUD.error("please enter your name")
            return }
        
        
        ProgressHUD.animate("please wait...",.barSweepToggle)
        NetworkService.shared.fetchCategoryDishes(dishId: dish.id ?? "", name: name) { result in
            switch result{
            case .success(_):
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
        
    }
    

    

}
