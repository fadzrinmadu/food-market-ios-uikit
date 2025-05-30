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
        setupTabBarStyles()
        setupTabBarItems()
    }
    
    private func setupTabBarStyles() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = ColorConstant.primaryWhite
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = ColorConstant.primaryWhite
            tabBar.standardAppearance = appearance
        } else {
            tabBar.barTintColor = ColorConstant.primaryWhite
        }
    }
    
    private func setupTabBarItems() {
        let foodHomeVC = FoodHomeRouter.createModule()
        foodHomeVC.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstant.home.withRenderingMode(.alwaysOriginal),
            selectedImage: ImageConstant.homeFilled.withRenderingMode(.alwaysOriginal)
        )
        
        let orderVC = UIViewController()
        orderVC.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstant.order.withRenderingMode(.alwaysOriginal),
            selectedImage: ImageConstant.orderFilled.withRenderingMode(.alwaysOriginal)
        )
        
        let profileVC = UIViewController()
        profileVC.tabBarItem = UITabBarItem(
            title: "",
            image: ImageConstant.profile.withRenderingMode(.alwaysOriginal),
            selectedImage: ImageConstant.profileFilled.withRenderingMode(.alwaysOriginal)
        )
        
        viewControllers = [foodHomeVC, orderVC, profileVC]
    }
}
