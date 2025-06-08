//
//  FoodDetailProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import Foundation

protocol FoodDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: FoodDetailInteractorToPresenterProtocol? { get set }
}

protocol FoodDetailInteractorToPresenterProtocol: AnyObject {
    
}

protocol FoodDetailPresenterToViewProtocol: AnyObject {
    
}

protocol FoodDetailViewToPresenterProtocol: AnyObject {
    var view: FoodDetailPresenterToViewProtocol? { get set }
    var interactor: FoodDetailPresenterToInteractorProtocol? { get set }
    var router: FoodDetailPresenterToRouterProtocol? { get set }
}

protocol FoodDetailPresenterToRouterProtocol: AnyObject {
    static func createModule() -> FoodDetailViewController
}
