//
//  FoodDetailViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import UIKit

struct FoodDetailData {
    let image: UIImage
    let title: String
    let rating: Float
    let description: String
    let ingredients: [String]
    let price: Int
}

class FoodDetailViewController: ContentViewController {
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsTitleLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var totalPriceTitleLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderNowButton: MainButton!
    
    var foodData: FoodDetailData = FoodDetailData(
        image: DummyConstant.Image.foodDetailImage1Dummy,
        title: "Cherry Healthy",
        rating: 4.5,
        description: "Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.",
        ingredients: ["Seledri", "telur", "blueberry", "madu"],
        price: 877786
    )
    
    weak var presenter: FoodDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setData(data: foodData) // MARK: REMOVED LATER
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayouts()
    }
    
    func setData(data: FoodDetailData) {
        bannerImageView.image = data.image
        titleLabel.text = data.title
        ratingView.setRating(data.rating)
        descriptionLabel.text = data.description
        ingredientsLabel.text = data.ingredients.joined(separator: ", ")
        totalPriceLabel.text = data.price.toRupiah()
    }
    
    private func setupUI() {
        setupStyles()
        setupGestures()
    }
    
    private func setupStyles() {
        titleLabel.font = FontConstant.poppinsRegular
        titleLabel.textColor = ColorConstant.primaryBlack
        quantityLabel.font = FontConstant.poppinsRegular
        quantityLabel.textColor = ColorConstant.primaryBlack
        descriptionLabel.font = FontConstant.poppinsRegularSmall
        descriptionLabel.textColor = ColorConstant.primaryGray
        descriptionLabel.setLineHeight(24)
        ingredientsTitleLabel.font = FontConstant.poppinsRegularSmall
        ingredientsTitleLabel.textColor = ColorConstant.primaryBlack
        ingredientsLabel.font = FontConstant.poppinsRegularSmall
        ingredientsLabel.textColor = ColorConstant.primaryGray
        totalPriceTitleLabel.font = FontConstant.poppinsRegularSmall
        totalPriceTitleLabel.textColor = ColorConstant.primaryGray
        totalPriceLabel.font = FontConstant.poppinsRegularMedium
        totalPriceLabel.textColor = ColorConstant.primaryBlack
    }
    
    private func setupGestures() {
        let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonPressed))
        backButtonView.addGestureRecognizer(backButtonTapGesture)
    }
    
    private func setupLayouts() {
        detailView.roundCorners([.topLeft, .topRight], radius: 20)
    }
    
    @objc
    private func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}

extension FoodDetailViewController: FoodDetailPresenterToViewProtocol {
    
}
