//
//  SignUpViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 13/05/25.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var headerView: HeaderView!

    weak var presenter: SignUpViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        headerView.setupData(
            data: HeaderViewData(
                title: "Sign Up",
                subtitle: "Register and eat",
                showBackButton: true
            )
        )
    }
}

extension SignUpViewController: SignUpPresenterToViewProtocol {
    
}
