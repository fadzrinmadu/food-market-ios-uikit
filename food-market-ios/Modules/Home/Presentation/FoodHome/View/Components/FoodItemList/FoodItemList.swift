//
//  FoodItemList.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import UIKit

class FoodItemList: UIView {
    var foodData: [FoodItemData] = [
        FoodItemData(image: DummyConstant.Image.foodItem1Dummy, title: "Soup Bumil", price: 289000, rating: 4.1),
        FoodItemData(image: DummyConstant.Image.foodItem2Dummy, title: "Chicken", price: 4509000, rating: 4.7),
        FoodItemData(image: DummyConstant.Image.foodItem3Dummy, title: "Shrimp", price: 999000, rating: 3.2),
    ]
    
    private let collectionView: UICollectionView
    
    override init(frame: CGRect) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register(FoodItemCell.self, forCellWithReuseIdentifier: FoodItemCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}

extension FoodItemList: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: FoodItemCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FoodItemCell.identifier,
            for: indexPath
        ) as? FoodItemCell else { return UICollectionViewCell() }
        cell.configure(with: foodData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
}
