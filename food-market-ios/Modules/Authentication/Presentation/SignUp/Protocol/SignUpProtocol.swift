//
//  SignUpProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 13/05/25.
//

import Foundation

protocol SignUpPresenterToInteractorProtocol: AnyObject {
    var presenter: SignUpInteractorToPresenterProtocol? { get set }
}

protocol SignUpInteractorToPresenterProtocol: AnyObject {
    
}

protocol SignUpPresenterToViewProtocol: AnyObject {
    
}

protocol SignUpViewToPresenterProtocol: AnyObject {
    var view: SignUpPresenterToViewProtocol? { get set }
    var interactor: SignUpPresenterToInteractorProtocol? { get set }
    var router: SignUpPresenterToRouterProtocol? { get set }
}

protocol SignUpPresenterToRouterProtocol: AnyObject {
    static func createModule() -> SignUpViewController
}
