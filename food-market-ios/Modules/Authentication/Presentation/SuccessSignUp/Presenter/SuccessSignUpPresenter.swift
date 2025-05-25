//
//  SuccessSignUpPresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import Foundation

class SuccessSignUpPresenter: SuccessSignUpViewToPresenterProtocol {
    var view: SuccessSignUpPresenterToViewProtocol?
    var interactor: SuccessSignUpPresenterToInteractorProtocol?
    var router: SuccessSignUpPresenterToRouterProtocol?
}

extension SuccessSignUpPresenter: SuccessSignUpInteractorToPresenterProtocol {
    
}
