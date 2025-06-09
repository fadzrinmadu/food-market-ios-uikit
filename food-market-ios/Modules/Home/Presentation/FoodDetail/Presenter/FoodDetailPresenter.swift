//
//  FoodDetailPresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import Foundation

class FoodDetailPresenter: FoodDetailViewToPresenterProtocol {
    var view: FoodDetailPresenterToViewProtocol?
    var interactor: FoodDetailPresenterToInteractorProtocol?
    var router: FoodDetailPresenterToRouterProtocol?
}

extension FoodDetailPresenter: FoodDetailInteractorToPresenterProtocol {
    
}
