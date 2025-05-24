//
//  SnackbarView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 24/05/25.
//

import UIKit

struct SnackbarViewData {
    var message: String
    var type: SnackbarViewType
}

enum SnackbarViewType {
    case success
    case failed
}

class SnackbarView: UIView {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setupData(data: SnackbarViewData) {
        messageLabel.text = data.message
        mainView.backgroundColor = data.type == .success 
            ? ColorConstant.primaryGreen
            : ColorConstant.primaryRed
    }
    
    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "SnackbarView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        
        messageLabel.font = FontConstant.poppinsRegularSmall
    }
}
