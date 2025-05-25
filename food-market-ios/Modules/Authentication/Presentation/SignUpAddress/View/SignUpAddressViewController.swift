//
//  SignUpAddressViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 18/05/25.
//

import UIKit

class SignUpAddressViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var phoneNumberInputTextField: InputTextField!
    @IBOutlet weak var addressInputTextField: InputTextField!
    @IBOutlet weak var houseNumberInputTextField: InputTextField!
    @IBOutlet weak var cityDropdownView: DropdownView!
    
    weak var presenter: SignUpAddressViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        headerView.setupData(
            data: HeaderViewData(
                title: "Address",
                subtitle: "Make sure it’s valid",
                showBackButton: true
            )
        )
        
        phoneNumberInputTextField.setupData(
            data: InputTextFieldData(
                label: "Phone No.",
                placeholder: "Type your phone number"
            )
        )
        
        addressInputTextField.setupData(
            data: InputTextFieldData(
                label: "Address",
                placeholder: "Type your address"
            )
        )
        
        houseNumberInputTextField.setupData(
            data: InputTextFieldData(
                label: "House No.",
                placeholder: "Type your house number"
            )
        )
        
        cityDropdownView.setupData(
            data: DropdownViewData(
                label: "City",
                placeholder: "Select your city"
            )
        )
    }
    
    @IBAction func signUpButtonPressed(_ sender: MainButton) {
        let vc: SuccessSignUpViewController = SuccessSignUpRouter.createModule()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SignUpAddressViewController: SignUpAddressPresenterToViewProtocol {
    
}
