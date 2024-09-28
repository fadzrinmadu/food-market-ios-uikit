//
//  SignInProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import Foundation

protocol SignInPresenterToInteractorProtocol: AnyObject {
    var presenter: SignInInteractorToPresenterProtocol? { get set }
}

protocol SignInInteractorToPresenterProtocol: AnyObject {
    
}

protocol SignInPresenterToViewProtocol: AnyObject {
    
}

protocol SignInViewToPresenterProtocol: AnyObject {
    var view: SignInPresenterToViewProtocol? { get set }
    var interactor: SignInPresenterToInteractorProtocol? { get set }
    var router: SignInPresenterToRouterProtocol? { get set }
}

protocol SignInPresenterToRouterProtocol: AnyObject {
    static func createModule() -> SignInViewController
}
