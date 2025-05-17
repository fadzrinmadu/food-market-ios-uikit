//
//  InputTextField.swift
//  food-market-ios
//
//  Created by Mac 2020 on 29/09/24.
//

import UIKit

struct InputTextFieldData {
    var label: String = ""
    var placeholder: String = ""
    var isSecure: Bool? = false
}

final class InputTextField: UIView {
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var inputTextField: PaddedTextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "InputTextField") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        inputLabel.textColor = ColorConstant.primaryBlack
        inputLabel.font = FontConstant.poppinsRegular
    }
    
    func setupData(data: InputTextFieldData) {
        inputLabel.text = data.label
        inputTextField.isSecureTextEntry = data.isSecure ?? false
        inputTextField.attributedPlaceholder = NSAttributedString(
            string: data.placeholder,
            attributes: [.foregroundColor: ColorConstant.primaryGray]
        )
    }
}
