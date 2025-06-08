//
//  FoodItem.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import UIKit

struct FoodItemData {
    let image: UIImage
    let title: String
    let price: Int
    let rating: Float
}

class FoodItem: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setData(data: FoodItemData) {
        imageView.image = data.image
        titleLabel.text = data.title
        priceLabel.text = data.price.toRupiah()
        ratingView.setRating(data.rating)
    }
    
    private func commonInit() {
        guard let view: UIView = self.loadViewFromNib(nibName: "FoodItem") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        setupUI()
    }
    
    private func setupUI() {
        imageView.layer.cornerRadius = 8
        titleLabel.font = FontConstant.poppinsRegular
        titleLabel.textColor = ColorConstant.primaryBlack
        priceLabel.font = FontConstant.poppinsRegular
        priceLabel.textColor = ColorConstant.primaryGray
    }
}
