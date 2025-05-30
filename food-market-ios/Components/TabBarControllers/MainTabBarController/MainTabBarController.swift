//
//  MainTabBarController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 30/05/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let foodHomeVC = FoodHomeRouter.createModule()
        foodHomeVC.view.backgroundColor = ColorConstant.backgroundColor
        foodHomeVC.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstant.home.withRenderingMode(.alwaysOriginal),
            selectedImage: ImageConstant.homeFilled.withRenderingMode(.alwaysOriginal)
        )
        
        let orderVC = UIViewController()
        orderVC.view.backgroundColor = ColorConstant.backgroundColor
        orderVC.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstant.order.withRenderingMode(.alwaysOriginal),
            selectedImage: ImageConstant.orderFilled.withRenderingMode(.alwaysOriginal)
        )
        
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = ColorConstant.backgroundColor
        profileVC.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstant.profile.withRenderingMode(.alwaysOriginal),
            selectedImage: ImageConstant.profileFilled.withRenderingMode(.alwaysOriginal)
        )
        
        viewControllers = [foodHomeVC, orderVC, profileVC]
    }
}
