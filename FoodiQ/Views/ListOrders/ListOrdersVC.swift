//
//  ListOrdersVC.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 27/01/2025.
//

import UIKit
import ProgressHUD
class ListOrdersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders:[Order] = [    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        register()
        ProgressHUD.animate("waiting...",.ballVerticalBounce)

    }
    override func viewDidAppear(_ animated: Bool) {
        
        NetworkService.shared.fetchOrders { [weak self] result in
            switch result{
            case .success(let orders):
                self?.orders = orders
                self?.tableView.reloadData()
                ProgressHUD.dismiss()
            case .failure(let error):
                ProgressHUD.error(error.localizedDescription)
            }
        }
    }
    
    private func register(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListOrdersVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = DishDetailsViewController.instantiate()
        
        
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}


