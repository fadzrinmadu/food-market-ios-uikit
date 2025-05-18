//
//  DropdownView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 18/05/25.
//

import UIKit

struct DropdownViewData {
    var label: String = ""
    var placeholder: String = ""
}

class DropdownView: UIView {
    @IBOutlet weak var dropdownView: UIView!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setupData(data: DropdownViewData) {
        inputLabel.text = data.label
        placeholderLabel.text = data.placeholder
    }
    
    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "DropdownView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
        dropdownView.layer.cornerRadius = 8
        dropdownView.layer.borderWidth = 1
        dropdownView.layer.borderColor = ColorConstant.primaryBlack.cgColor
        inputLabel.font = FontConstant.poppinsRegular
        placeholderLabel.font = FontConstant.poppinsRegular
    }
}
