//
//  HomeVC.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 26/01/2025.
//

import UIKit
import ProgressHUD
class HomeVC: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var populerCollectionView: UICollectionView!
    
    @IBOutlet weak var spectialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var populers: [Dish] = []
    var specials: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        NetworkService.shared.myFirstRequest { result in
//            switch result{
//            case .success(let data):
//                print("the decoded data is:\(data)")
//                for dish in data{
//                    print(dish.name)
//                }
//            case .failure(let error):
//                print("the error is:\(error)")
//            }
//        }
        
        startLoading()
        NetworkService.shared.fetchAllCategories { [weak self] result in
            switch result{
                
            case .success(let allDishes):
                print("the result is:\(allDishes)")
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populers = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                self?.categoryCollectionView.reloadData()
                self?.populerCollectionView.reloadData()
                self?.spectialsCollectionView.reloadData()
            case .failure(let error):
                print("the error is:\(error)")
                ProgressHUD.error(error.localizedDescription)
            }
        }
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        populerCollectionView.dataSource = self
        populerCollectionView.delegate = self
        
        spectialsCollectionView.dataSource = self
        spectialsCollectionView.delegate = self
        
        registerCells()
        // Do any additional setup after loading the view.
    }
    func startLoading(){
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.animate("Please wait...", .ballVerticalBounce)
       ProgressHUD.animate("FoodiQ...")
        ProgressHUD.animate("FoodiQ...", interaction: false)
        ProgressHUD.colorAnimation = .systemBlue
    }
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        populerCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
       
        spectialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
        
    }
    
}

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case populerCollectionView:
            return populers.count
        case spectialsCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch collectionView{
        case categoryCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            
            return cell
        case populerCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populers[indexPath.row])
            
            return cell
        case spectialsCollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            
            return cell
        default:
            return UICollectionViewCell()
        }

        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesVC.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = DishDetailsViewController.instantiate()
            controller.dish = collectionView == populerCollectionView ? populers[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
