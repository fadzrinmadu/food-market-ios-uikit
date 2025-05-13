//
//  SignUpPresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 13/05/25.
//

import Foundation

class SignUpPresenter: SignUpViewToPresenterProtocol {
    var view: SignUpPresenterToViewProtocol?
    var interactor: SignUpPresenterToInteractorProtocol?
    var router: SignUpPresenterToRouterProtocol?
}

extension SignUpPresenter: SignUpInteractorToPresenterProtocol {
    
}
