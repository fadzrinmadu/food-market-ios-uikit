//
//  SuccessOrderViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 22/06/25.
//

import UIKit

class SuccessOrderViewController: ContentViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    weak var presenter: SuccessOrderViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupStyles()
    }
    
    private func setupStyles() {
        titleLabel.font = FontConstant.poppinsRegularLarge
        titleLabel.text = "You’ve Made Order"
        titleLabel.textColor = ColorConstant.primaryBlack

        descriptionLabel.font = FontConstant.poppinsLightSmall
        descriptionLabel.text = "Just stay at home while we are preparing your best foods"
        descriptionLabel.textColor = ColorConstant.primaryGray
    }
}

extension SuccessOrderViewController: SuccessOrderPresenterToViewProtocol {
    
}
