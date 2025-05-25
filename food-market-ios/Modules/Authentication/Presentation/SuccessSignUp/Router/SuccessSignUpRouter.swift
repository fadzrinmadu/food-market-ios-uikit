//
//  SuccessSignUpRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import Foundation

class SuccessSignUpRouter: SuccessSignUpPresenterToRouterProtocol {
    static func createModule() -> SuccessSignUpViewController {
        let view: SuccessSignUpViewController = SuccessSignUpViewController()
        let presenter: SuccessSignUpViewToPresenterProtocol & SuccessSignUpInteractorToPresenterProtocol = SuccessSignUpPresenter()
        let interactor: SuccessSignUpPresenterToInteractorProtocol = SuccessSignUpInteractor()
        let router: SuccessSignUpRouter = SuccessSignUpRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
