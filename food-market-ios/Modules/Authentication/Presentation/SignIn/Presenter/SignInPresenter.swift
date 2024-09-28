//
//  SignInPresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import Foundation

class SignInPresenter: SignInViewToPresenterProtocol {
    var view: SignInPresenterToViewProtocol?
    var interactor: SignInPresenterToInteractorProtocol?
    var router: SignInPresenterToRouterProtocol?
}

extension SignInPresenter: SignInInteractorToPresenterProtocol {
    
}
