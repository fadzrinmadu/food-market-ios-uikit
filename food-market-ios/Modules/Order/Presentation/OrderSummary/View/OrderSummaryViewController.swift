//
//  OrderSummaryViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 09/06/25.
//

import UIKit

class OrderSummaryViewController: ContentViewController {
    weak var presenter: OrderSummaryViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OrderSummaryViewController: OrderSummaryPresenterToViewProtocol {
    
}
