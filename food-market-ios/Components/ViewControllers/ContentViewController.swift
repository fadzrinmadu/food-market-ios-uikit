//
//  ContentViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 09/06/25.
//

import UIKit

class ContentViewController: UIViewController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
