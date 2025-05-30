//
//  FoodHomeViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import UIKit

class FoodHomeViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    weak var presenter: FoodHomeViewToPresenterProtocol?
    
    let foodData: [FoodCardData] = [
        FoodCardData(image: DummyConstant.Image.foodCard1Dummy, title: "Cherry Healthy", rating: 4.5),
        FoodCardData(image: DummyConstant.Image.foodCard2Dummy, title: "Burger Tamayo", rating: 4.5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        headerView.setupData(
            data: HeaderViewData(
                title: "FoodMarket",
                subtitle: "Let’s get some foods",
                profileImage: DummyConstant.Image.profileDummy,
                showProfileImage: true
            )
        )
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 210)
        layout.minimumLineSpacing = 24
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        
        foodCollectionView.collectionViewLayout = layout
        foodCollectionView.backgroundColor = .clear
        foodCollectionView.showsHorizontalScrollIndicator = false
        foodCollectionView.register(FoodCardCell.self, forCellWithReuseIdentifier: FoodCardCell.identifier)
        foodCollectionView.dataSource = self
    }
}

extension FoodHomeViewController: FoodHomePresenterToViewProtocol {
    
}
