//
//  FoodHomeRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import Foundation

class FoodHomeRouter: FoodHomePresenterToRouterProtocol {
    static func createModule() -> FoodHomeViewController {
        let view: FoodHomeViewController = FoodHomeViewController()
        let presenter: FoodHomeViewToPresenterProtocol & FoodHomeInteractorToPresenterProtocol = FoodHomePresenter()
        let interactor: FoodHomePreseterToInteractorProtocol = FoodHomeInteractor()
        let router: FoodHomeRouter = FoodHomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
