//
//  FoodHomePresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import Foundation

class FoodHomePresenter: FoodHomeViewToPresenterProtocol {
    var view: FoodHomePresenterToViewProtocol?
    var interactor: FoodHomePreseterToInteractorProtocol?
    var router: FoodHomePresenterToRouterProtocol?
}

extension FoodHomePresenter: FoodHomeInteractorToPresenterProtocol {
    
}
