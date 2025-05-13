//
//  HeaderView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import UIKit

struct HeaderViewData {
    var title: String = ""
    var subtitle: String = ""
    var profileImage: UIImage? = UIImage()
    var showBackButton: Bool? = false
    var showProfileImage: Bool? = false
}

final class HeaderView: UIView {
    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "HeaderView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        
        backButtonView.isHidden = true
        profileView.isHidden = true
        
        let backButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonPressed))
        backButtonView.addGestureRecognizer(backButtonTapGesture)
        backButtonView.isUserInteractionEnabled = true
    }
    
    func setupData(data: HeaderViewData) {
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        
        if (data.showBackButton ?? false) {
            backButtonView.isHidden = false
        }
        
        if (data.showProfileImage ?? false) {
            profileView.isHidden = false
            profileImageView.image = data.profileImage
        }
    }
    
    @objc 
    private func backButtonPressed() {
        if let viewController = self.parentViewController() {
            viewController.navigationController?.popViewController(animated: true)
        }
    }
}
