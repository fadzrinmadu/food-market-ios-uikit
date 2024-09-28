//
//  SignInRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import Foundation

class SignInRouter: SignInPresenterToRouterProtocol {
    static func createModule() -> SignInViewController {
        let view = SignInViewController()
        let presenter: SignInViewToPresenterProtocol & SignInInteractorToPresenterProtocol = SignInPresenter()
        let interactor: SignInPresenterToInteractorProtocol = SignInInteractor()
        let router: SignInPresenterToRouterProtocol = SignInRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
