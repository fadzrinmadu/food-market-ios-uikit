//
//  RatingView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 30/05/25.
//

import UIKit

class RatingView: UIView {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    private var starImageViews: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setRating(_ rating: Float) {
        for (index, star) in starImageViews.enumerated() {
            if Float(index) < rating {
                star.image = ImageConstant.starFilled
            } else {
                star.image = ImageConstant.star
            }
        }
        
        ratingLabel.text = String(format: "%.1f", rating)
    }
    
    private func commonInit() {
        guard let view: UIView = self.loadViewFromNib(nibName: "RatingView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        setupUI()
    }
    
    private func setupUI() {
        setupStyles()
        setupStars()
    }
    
    private func setupStyles() {
        ratingLabel.font = FontConstant.poppinsRegularXSmall
        ratingLabel.textColor = ColorConstant.primaryGray
    }
    
    private func setupStars() {
        starImageViews = stackView.arrangedSubviews.compactMap { $0 as? UIImageView }
    }
}
