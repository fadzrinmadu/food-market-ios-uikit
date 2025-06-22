//
//  SuccessOrderPresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 22/06/25.
//

import Foundation

class SuccessOrderPresenter: SuccessOrderViewToPresenterProtocol {
    var view: SuccessOrderPresenterToViewProtocol?
    var interactor: SuccessOrderPresenterToInteractorProtocol?
    var router: SuccessOrderPresenterToRouterProtocol?
}

extension SuccessOrderPresenter: SuccessOrderInteractorToPresenterProtocol {
    
}
