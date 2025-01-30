//
//  OnboardingVC.swift
//  FoodiQ
//
//  Created by mohamed ahmed on 26/01/2025.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [
            OnboardingSlide(title: "delicious dishes", description: "cncklamlklkas cnlanclakclklkama", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "delicious dishes2", description: "cncklamlklkascncklamlklkascncklamlklkas cnlanclakclklkama", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "delicious dishes3", description: "cncklvvvvvvvvvvvvcncklamlklkascncklamlklkasvvamlklkas cnlanclakclklkama", image: #imageLiteral(resourceName: "slide3"))
        ]
        
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true)
            
        }else{
            currentPage += 1
            let indexpath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            
        }
            
        
    }
    
    
}

extension OnboardingVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCVCell.identifier, for: indexPath) as! OnboardingCVCell
        
        cell.setup(slides[indexPath.row])
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int( scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
