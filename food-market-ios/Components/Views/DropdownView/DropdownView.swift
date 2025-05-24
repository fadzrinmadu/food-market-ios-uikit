//
//  DropdownView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 18/05/25.
//

import UIKit
import DropDown

struct DropdownViewData {
    var label: String = ""
    var placeholder: String = ""
    var selectOptions: [String] = []
}

class DropdownView: UIView {
    @IBOutlet weak var dropdownView: UIView!
    @IBOutlet weak var dropdownButton: UIButton!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    var selectOptions = ["Value 1", "Value 2", "Value 3", "Value 4", "Value 5"]
    let dropdown = DropDown()
    
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
        selectOptions = data.selectOptions
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
        
        dropdown.anchorView = dropdownView
        dropdown.dataSource = selectOptions
        
        dropdown.bottomOffset = CGPoint(x: 0, y: (dropdown.anchorView?.plainView.bounds.height)!)
        dropdown.topOffset = CGPoint(x: 0, y: -(dropdown.anchorView?.plainView.bounds.height)!)
        
        dropdown.direction = .bottom
        dropdown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            self.inputLabel.text = selectOptions[index]
            self.inputLabel.textColor = ColorConstant.primaryBlack
        }
        
        let dropdownButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(dropdownButtonPressed))
        dropdownView.addGestureRecognizer(dropdownButtonTapGesture)
        dropdownView.isUserInteractionEnabled = true
    }
    
    @objc
    private func dropdownButtonPressed() {
        dropdown.show()
    }
}
