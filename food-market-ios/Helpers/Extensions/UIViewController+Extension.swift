//
//  UIViewController+Extension.swift
//  food-market-ios
//
//  Created by Mac 2020 on 24/05/25.
//

import UIKit

extension UIViewController {
    func showSnackbar(message: String, type: SnackbarViewType, duration: TimeInterval = 2.0) {
        let snackbar = SnackbarView()
        snackbar.translatesAutoresizingMaskIntoConstraints = false
        snackbar.setupData(data: SnackbarViewData(message: message, type: type))

        view.addSubview(snackbar)

        NSLayoutConstraint.activate([
            snackbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            snackbar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            snackbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            snackbar.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])

        snackbar.alpha = 0
        UIView.animate(withDuration: 0.3) {
            snackbar.alpha = 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: 0.3, animations: {
                snackbar.alpha = 0
            }) { _ in
                snackbar.removeFromSuperview()
            }
        }
    }
}
