//
//  SuccessOrderViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 22/06/25.
//

import UIKit

class SuccessOrderViewController: ContentViewController {
    weak var presenter: SuccessOrderViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SuccessOrderViewController: SuccessOrderPresenterToViewProtocol {
    
}
