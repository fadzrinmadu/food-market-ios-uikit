//
//  SuccessSignUpProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import Foundation

protocol SuccessSignUpPresenterToInteractorProtocol: AnyObject {
    var presenter: SuccessSignUpInteractorToPresenterProtocol? { get set }
}

protocol SuccessSignUpInteractorToPresenterProtocol: AnyObject {
    
}

protocol SuccessSignUpPresenterToViewProtocol: AnyObject {
    
}

protocol SuccessSignUpViewToPresenterProtocol: AnyObject {
    var view: SuccessSignUpPresenterToViewProtocol? { get set }
    var interactor: SuccessSignUpPresenterToInteractorProtocol? { get set }
    var router: SuccessSignUpPresenterToRouterProtocol? { get set }
}

protocol SuccessSignUpPresenterToRouterProtocol: AnyObject {
    static func createModule() -> SuccessSignUpViewController
}
