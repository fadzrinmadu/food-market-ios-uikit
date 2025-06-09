//
//  FoodHomeViewController+UICollectionView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 30/05/25.
//

import UIKit

extension FoodHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: FoodCardCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FoodCardCell.identifier,
            for: indexPath
        ) as? FoodCardCell else { return UICollectionViewCell() }
        cell.configure(with: foodData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController: FoodDetailViewController = FoodDetailRouter.createModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
