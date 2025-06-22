//
//  SuccessOrderProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 22/06/25.
//

import Foundation

protocol SuccessOrderPresenterToInteractorProtocol: AnyObject {
    var presenter: SuccessOrderInteractorToPresenterProtocol? { get set }
}

protocol SuccessOrderInteractorToPresenterProtocol: AnyObject {
    
}

protocol SuccessOrderPresenterToViewProtocol: AnyObject {
    
}

protocol SuccessOrderViewToPresenterProtocol: AnyObject {
    var view: SuccessOrderPresenterToViewProtocol? { get set }
    var interactor: SuccessOrderPresenterToInteractorProtocol? { get set }
    var router: SuccessOrderPresenterToRouterProtocol? { get set }
}

protocol SuccessOrderPresenterToRouterProtocol: AnyObject {
    static func createModule() -> SuccessOrderViewController
}
