//
//  SignUpRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 13/05/25.
//

import Foundation

class SignUpRouter: SignUpPresenterToRouterProtocol {
    static func createModule() -> SignUpViewController {
        let view: SignUpViewController = SignUpViewController()
        let presenter: SignUpViewToPresenterProtocol & SignUpInteractorToPresenterProtocol = SignUpPresenter()
        let interactor: SignUpPresenterToInteractorProtocol = SignUpInteractor()
        let router: SignUpPresenterToRouterProtocol = SignUpRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
