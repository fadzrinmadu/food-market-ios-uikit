//
//  FoodHomeProtocol.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import Foundation

protocol FoodHomePreseterToInteractorProtocol: AnyObject {
    var presenter: FoodHomeInteractorToPresenterProtocol? { get set }
}

protocol FoodHomeInteractorToPresenterProtocol: AnyObject {
    
}

protocol FoodHomePresenterToViewProtocol: AnyObject {
    
}

protocol FoodHomeViewToPresenterProtocol: AnyObject {
    var view: FoodHomePresenterToViewProtocol? { get set }
    var interactor: FoodHomePreseterToInteractorProtocol? { get set }
    var router: FoodHomePresenterToRouterProtocol? { get set }
}

protocol FoodHomePresenterToRouterProtocol: AnyObject {
    static func createModule() -> FoodHomeViewController
}
