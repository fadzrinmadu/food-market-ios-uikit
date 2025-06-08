//
//  FoodDetailViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import UIKit

class FoodDetailViewController: BaseViewController {
    weak var presenter: FoodDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FoodDetailViewController: FoodDetailPresenterToViewProtocol {
    
}
