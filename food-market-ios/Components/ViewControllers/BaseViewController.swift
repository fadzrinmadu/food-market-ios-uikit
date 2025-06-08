//
//  BaseViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import UIKit

class BaseViewController: UIViewController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
