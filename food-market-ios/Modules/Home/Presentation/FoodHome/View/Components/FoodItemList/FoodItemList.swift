//
//  FoodItemList.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import UIKit

class FoodItemList: UIView {
    private let foodData: [FoodItemViewData] = [
        FoodItemViewData(image: DummyConstant.Image.foodItem1Dummy, title: "Soup Bumil", price: 289000, rating: 4.1),
        FoodItemViewData(image: DummyConstant.Image.foodItem2Dummy, title: "Chicken", price: 4509000, rating: 4.7),
        FoodItemViewData(image: DummyConstant.Image.foodItem3Dummy, title: "Shrimp", price: 999000, rating: 3.2),
    ]

    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)

        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FoodItemCell.self, forCellWithReuseIdentifier: FoodItemCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension FoodItemList: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FoodItemCell.identifier,
            for: indexPath
        ) as? FoodItemCell else { return UICollectionViewCell() }

        cell.configure(with: foodData[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width - 48, height: 60)
    }
}
