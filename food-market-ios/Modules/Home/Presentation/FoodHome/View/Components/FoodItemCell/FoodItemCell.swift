//
//  FoodItemCell.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import UIKit

class FoodItemCell: UICollectionViewCell {
    static let identifier: String = "FoodItemCell"
    
    private let foodItem: FoodItem = FoodItem()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configure(with data: FoodItemData) {
        foodItem.setData(data: data)
    }
    
    private func commonInit() {
        contentView.addSubview(foodItem)
        foodItem.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            foodItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
