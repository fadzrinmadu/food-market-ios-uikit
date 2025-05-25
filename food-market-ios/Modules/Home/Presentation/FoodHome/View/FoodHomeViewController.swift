//
//  FoodHomeViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 25/05/25.
//

import UIKit

class FoodHomeViewController: BaseViewController {
    weak var presenter: FoodHomeViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FoodHomeViewController: FoodHomePresenterToViewProtocol {
    
}
