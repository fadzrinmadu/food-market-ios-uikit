//
//  SignUpAddressRouter.swift
//  food-market-ios
//
//  Created by Mac 2020 on 18/05/25.
//

import Foundation

class SignUpAddressRouter: SignUpAddressPresenterToRouterProtocol {
    static func createModule() -> SignUpAddressViewController {
        let view: SignUpAddressViewController = SignUpAddressViewController()
        let presenter: SignUpAddressViewToPresenterProtocol & SignUpAddressInteractorToPresenterProtocol = SignUpAddressPresenter()
        let interactor: SignUpAddressPresenterToInteractorProtocol = SignUpAddressInteractor()
        let router: SignUpAddressRouter = SignUpAddressRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
