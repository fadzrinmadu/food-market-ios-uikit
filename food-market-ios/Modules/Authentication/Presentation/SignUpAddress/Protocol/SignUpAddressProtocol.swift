//
//  SignUpAddressProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 18/05/25.
//

import Foundation

protocol SignUpAddressPresenterToInteractorProtocol: AnyObject {
    var presenter: SignUpAddressInteractorToPresenterProtocol? { get set }
}

protocol SignUpAddressInteractorToPresenterProtocol: AnyObject {
    
}

protocol SignUpAddressPresenterToViewProtocol: AnyObject {
    
}

protocol SignUpAddressViewToPresenterProtocol: AnyObject {
    var view: SignUpAddressPresenterToViewProtocol? { get set }
    var interactor: SignUpAddressPresenterToInteractorProtocol? { get set }
    var router: SignUpAddressPresenterToRouterProtocol? { get set }
}

protocol SignUpAddressPresenterToRouterProtocol: AnyObject {
    static func createModule() -> SignUpAddressViewController
}
