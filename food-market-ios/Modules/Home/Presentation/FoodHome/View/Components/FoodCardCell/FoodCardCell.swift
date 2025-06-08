//
//  FoodCardCell.swift
//  food-market-ios
//
//  Created by Mac 2020 on 30/05/25.
//

import UIKit

class FoodCardCell: UICollectionViewCell {
    static let identifier: String = "FoodCardCell"
    
    private let foodCard: FoodCard = FoodCard()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configure(with data: FoodCardData) {
        foodCard.setData(data: data)
    }
    
    private func commonInit() {
        contentView.addSubview(foodCard)
        foodCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            foodCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
