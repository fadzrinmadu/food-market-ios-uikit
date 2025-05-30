//
//  FoodCard.swift
//  food-market-ios
//
//  Created by Mac 2020 on 30/05/25.
//

import UIKit

struct FoodCardData {
    let image: UIImage
    let title: String
    let rating: Float
}

class FoodCard: UIView {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setData(data: FoodCardData) {
        imageView.image = data.image
        titleLabel.text = data.title
        ratingView.setRating(data.rating)
    }
    
    private func commonInit() {
        guard let view: UIView = self.loadViewFromNib(nibName: "FoodCard") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        setupUI()
    }
    
    private func setupUI() {
        mainView.backgroundColor = ColorConstant.primaryWhite
        mainView.layer.cornerRadius = 8
        mainView.addShadow(
            color: ColorConstant.primaryWhiteLight,
            opacity: 1,
            offset: CGSize(width: 0, height: 6),
            radius: 15
        )
        imageView.image = DummyConstant.Image.foodCard1Dummy
        titleLabel.font = FontConstant.poppinsRegular
        titleLabel.textColor = ColorConstant.primaryBlack
    }
}
