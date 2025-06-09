//
//  OrderSummaryProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 09/06/25.
//

import Foundation

protocol OrderSummaryPresenterToInteractorProtocol: AnyObject {
    var presenter: OrderSummaryInteractorToPresenterProtocol? { get set }
}

protocol OrderSummaryInteractorToPresenterProtocol: AnyObject {
    
}

protocol OrderSummaryPresenterToViewProtocol: AnyObject {
    
}

protocol OrderSummaryViewToPresenterProtocol: AnyObject {
    var view: OrderSummaryPresenterToViewProtocol? { get set }
    var interactor: OrderSummaryPresenterToInteractorProtocol? { get set }
    var router: OrderSummaryPresenterToRouterProtocol? { get set }
}

protocol OrderSummaryPresenterToRouterProtocol: AnyObject {
    static func createModule() -> OrderSummaryViewController
}
