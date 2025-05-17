//
//  PaddedTextField.swift
//  food-market-ios
//
//  Created by Mac 2020 on 29/09/24.
//

import UIKit

class PaddedTextField: UITextField {
    // MARK: - Properties
    var textPadding: UIEdgeInsets

    // MARK: - Initializers
    init(padding: UIEdgeInsets) {
        self.textPadding = padding
        super.init(frame: .zero)
        setupStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        self.textPadding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.init(coder: aDecoder)
        setupStyle()
    }
    
    // MARK: - UITextField Overrides
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func becomeFirstResponder() -> Bool {
        self.layer.borderColor = ColorConstant.primaryGreen.cgColor
        return super.becomeFirstResponder()
    }
    
    override func resignFirstResponder() -> Bool {
        self.layer.borderColor = ColorConstant.primaryBlack.cgColor
        return super.resignFirstResponder()
    }
    
    // MARK: - Private Methods
    private func setupStyle() {
        self.textColor = ColorConstant.primaryBlack
        self.font = FontConstant.poppinsRegularSmall
        self.layer.borderColor = ColorConstant.primaryBlack.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}
