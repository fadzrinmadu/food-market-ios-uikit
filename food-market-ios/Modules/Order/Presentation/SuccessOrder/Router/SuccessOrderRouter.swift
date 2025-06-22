//
//  SuccessOrderRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 22/06/25.
//

import Foundation

class SuccessOrderRouter: SuccessOrderPresenterToRouterProtocol {
    static func createModule() -> SuccessOrderViewController {
        let view: SuccessOrderViewController = SuccessOrderViewController()
        let presenter: SuccessOrderViewToPresenterProtocol & SuccessOrderInteractorToPresenterProtocol = SuccessOrderPresenter()
        let interactor: SuccessOrderPresenterToInteractorProtocol = SuccessOrderInteractor()
        let router: SuccessOrderRouter = SuccessOrderRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
