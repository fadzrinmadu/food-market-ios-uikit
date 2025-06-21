//
//  FoodItemView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import UIKit

struct FoodItemViewData {
    let image: UIImage
    let title: String
    let price: Int
    let rating: Float?
    let qty: Int?
    let date: String?
    let status: String?
    let isShowStatus: Bool?
    let isShowQtyRight: Bool?

    init(
        image: UIImage,
        title: String,
        price: Int,
        rating: Float? = 0,
        qty: Int? = 0,
        date: String? = "",
        status: String? = "",
        isShowStatus: Bool? = false,
        isShowQtyRight: Bool? = false
    ) {
        self.image = image
        self.title = title
        self.price = price
        self.rating = rating
        self.qty = qty
        self.date = date
        self.status = status
        self.isShowStatus = isShowStatus
        self.isShowQtyRight = isShowQtyRight
    }
}

class FoodItemView: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingContainerView: UIView!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var statusContainerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var qtyContainerView: UIView!
    @IBOutlet weak var qtyLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setData(data: FoodItemViewData) {
        imageView.image = data.image
        titleLabel.text = data.title
        descriptionLabel.text = getDescriptionWithQty(price: data.price, qty: data.isShowQtyRight ?? false ? 0 : data.qty)
        ratingView.setRating(data.rating ?? 0)
        ratingContainerView.isHidden = data.isShowStatus ?? false || data.isShowQtyRight ?? false
        statusContainerView.isHidden = !(data.isShowStatus ?? false)
        dateLabel.text = data.date ?? ""
        statusLabel.text = data.status ?? ""
        statusLabel.textColor = getStatusColorText(status: data.status ?? "")
        qtyContainerView.isHidden = !(data.isShowQtyRight ?? false)
        qtyLabel.text = "\(data.qty ?? 0) items"
    }
    
    private func commonInit() {
        guard let view: UIView = self.loadViewFromNib(nibName: "FoodItemView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        setupUI()
    }
    
    private func setupUI() {
        imageView.layer.cornerRadius = 8
        titleLabel.font = FontConstant.poppinsRegular
        titleLabel.textColor = ColorConstant.primaryBlack
        descriptionLabel.font = FontConstant.poppinsRegular
        descriptionLabel.textColor = ColorConstant.primaryGray
        ratingContainerView.isHidden = false
        statusContainerView.isHidden = true
        dateLabel.font = FontConstant.poppinsRegularXXSmall
        dateLabel.textColor = ColorConstant.primaryGray
        statusLabel.font = FontConstant.poppinsRegularXXSmall
        statusLabel.textColor = UIColor.clear
        qtyLabel.font = FontConstant.poppinsRegularXSmall
        qtyLabel.textColor = ColorConstant.primaryGray
    }
    
    private func getDescriptionWithQty(price: Int, qty: Int?) -> String {
        var descriptionText: String = ""
        if let qty = qty, qty > 0 {
            descriptionText = "\(qty) items • \(price.toRupiah())"
        } else {
            descriptionText = "\(price.toRupiah())"
        }
        return descriptionText
    }
    
    private func getStatusColorText(status: String) -> UIColor {
        switch status.lowercased() {
        case "cancelled":
            return ColorConstant.primaryRed
        default:
            return UIColor.clear
        }
    }
}
