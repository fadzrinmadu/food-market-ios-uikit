//
//  OrderSummaryRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 09/06/25.
//

import Foundation

class OrderSummaryRouter: OrderSummaryPresenterToRouterProtocol {
    static func createModule() -> OrderSummaryViewController {
        let view: OrderSummaryViewController = OrderSummaryViewController()
        let presenter: OrderSummaryViewToPresenterProtocol & OrderSummaryInteractorToPresenterProtocol = OrderSummaryPresenter()
        let interactor: OrderSummaryPresenterToInteractorProtocol = OrderSummaryInteractor()
        let router: OrderSummaryRouter = OrderSummaryRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
