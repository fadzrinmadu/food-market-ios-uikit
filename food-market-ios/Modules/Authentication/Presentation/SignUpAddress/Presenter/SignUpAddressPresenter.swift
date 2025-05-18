//
//  SignUpAddressPresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 18/05/25.
//

import Foundation

class SignUpAddressPresenter: SignUpAddressViewToPresenterProtocol {
    var view: SignUpAddressPresenterToViewProtocol?
    var interactor: SignUpAddressPresenterToInteractorProtocol?
    var router: SignUpAddressPresenterToRouterProtocol?
}

extension SignUpAddressPresenter: SignUpAddressInteractorToPresenterProtocol {
    
}
