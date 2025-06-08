//
//  FoodDetailRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import Foundation

class FoodDetailRouter: FoodDetailPresenterToRouterProtocol {
    static func createModule() -> FoodDetailViewController {
        let view: FoodDetailViewController = FoodDetailViewController()
        let presenter: FoodDetailViewToPresenterProtocol & FoodDetailInteractorToPresenterProtocol = FoodDetailPresenter()
        let interactor: FoodDetailPresenterToInteractorProtocol = FoodDetailInteractor()
        let router: FoodDetailRouter = FoodDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
