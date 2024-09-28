//
//  SignInViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import UIKit

class SignInViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var emailInputTextField: InputTextField!
    @IBOutlet weak var passwordInputTextField: InputTextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createNewAccountButton: UIButton!
    
    weak var presenter: SignInViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        headerView.setupData(
            data: HeaderViewData(
                title: "Sign In",
                subtitle: "Find your best ever meal"
            )
        )
        
        emailInputTextField.setupData(
            data: InputTextFieldData(
                label: "Email Address",
                placeholder: "Type your email address"
            )
        )
        
        passwordInputTextField.setupData(
            data: InputTextFieldData(
                label: "Password",
                placeholder: "Type your password",
                isSecure: true
            )
        )
        
        signInButton.layer.cornerRadius = 8
        signInButton.clipsToBounds = true
        
        createNewAccountButton.layer.cornerRadius = 8
        createNewAccountButton.clipsToBounds = true
    }
}

extension SignInViewController: SignInPresenterToViewProtocol {
    
}
