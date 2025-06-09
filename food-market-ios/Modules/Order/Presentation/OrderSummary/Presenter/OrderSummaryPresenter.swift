//
//  OrderSummaryPresenter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 09/06/25.
//

import Foundation

class OrderSummaryPresenter: OrderSummaryViewToPresenterProtocol {
    var view: OrderSummaryPresenterToViewProtocol?
    var interactor: OrderSummaryPresenterToInteractorProtocol?
    var router: OrderSummaryPresenterToRouterProtocol?
}

extension OrderSummaryPresenter: OrderSummaryInteractorToPresenterProtocol {
    
}
