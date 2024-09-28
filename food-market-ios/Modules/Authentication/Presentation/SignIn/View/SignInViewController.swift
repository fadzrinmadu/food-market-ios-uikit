//
//  SignInViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import UIKit

class SignInViewController: UIViewController {
    weak var presenter: SignInViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SignInViewController: SignInPresenterToViewProtocol {
    
}
