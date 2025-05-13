//
//  MainButton.swift
//  food-market-ios
//
//  Created by Mac 2020 on 13/05/25.
//

import UIKit

@IBDesignable
class MainButton: UIButton {
    @IBInspectable var customTitle: String = "" {
        didSet {
            setTitle(customTitle, for: .normal)
        }
    }
    
    @IBInspectable var customTitleColor: UIColor = ColorConstant.primaryBlack {
        didSet {
            setTitleColor(customTitleColor, for: .normal)
        }
    }
    
    @IBInspectable var customBackgroundColor: UIColor = ColorConstant.primaryYellow {
        didSet {
            backgroundColor = customBackgroundColor
        }
    }
    
    @IBInspectable var customCornerRadius: CGFloat = 8 {
        didSet {
            layer.cornerRadius = customCornerRadius
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let defaultHeight: CGFloat = 45
        let width = super.intrinsicContentSize.width
        return CGSize(width: width, height: defaultHeight)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        setTitle(customTitle, for: .normal)
        setTitleColor(customTitleColor, for: .normal)
        backgroundColor = customBackgroundColor
        layer.cornerRadius = customCornerRadius
        titleLabel?.font = FontConstant.poppinsMediumSmall
    }
}
