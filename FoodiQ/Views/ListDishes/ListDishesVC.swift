//
//  ListDishesVC.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import UIKit
import ProgressHUD
class ListDishesVC: UIViewController {

    
    var dishes:[Dish] = []
    var category: DishCategory!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        title = category.title
        
        registerCells()
        ProgressHUD.animate("wait..",.horizontalDotScaling)
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            switch result{
            case .success(let dishes):
                self?.dishes = dishes
                self?.tableView.reloadData()
                ProgressHUD.succeed()
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
        
    }


}
extension ListDishesVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
