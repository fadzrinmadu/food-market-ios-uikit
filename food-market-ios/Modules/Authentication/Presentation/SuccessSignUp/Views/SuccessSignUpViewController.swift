//
//  SuccessSignUpViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import UIKit

class SuccessSignUpViewController: BaseViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var signUpButton: MainButton!
    
    weak var presenter: SuccessSignUpViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.font = FontConstant.poppinsRegularLarge
        titleLabel.textColor = ColorConstant.primaryBlack
        descriptionLabel.font = FontConstant.poppinsLightSmall
        descriptionLabel.textColor = ColorConstant.primaryGray
    }
}

extension SuccessSignUpViewController: SuccessSignUpPresenterToViewProtocol {
    
}
