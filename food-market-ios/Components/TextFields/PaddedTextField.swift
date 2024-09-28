//
//  PaddedTextField.swift
//  food-market-ios
//
//  Created by Mac 2020 on 29/09/24.
//

import UIKit

class PaddedTextField: UITextField {
    var textPadding: UIEdgeInsets

    init(padding: UIEdgeInsets) {
        self.textPadding = padding
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        self.textPadding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.init(coder: aDecoder)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
}
