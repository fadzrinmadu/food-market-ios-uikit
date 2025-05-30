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
    }

    @IBAction func signInButtonPressed(_ sender: MainButton) {
        guard let sceneDelegate: SceneDelegate = UIApplication.shared.connectedScenes
            .first?.delegate as? SceneDelegate else { return }
        let tabBarController: MainTabBarController = MainTabBarController()
        sceneDelegate.window?.rootViewController = tabBarController
    }
    
    @IBAction func SignUpButtonPressed(_ sender: MainButton) {
        let vc: SignUpViewController = SignUpRouter.createModule()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SignInViewController: SignInPresenterToViewProtocol {
    
}
