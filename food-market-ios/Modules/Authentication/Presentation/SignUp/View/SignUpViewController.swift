//
//  SignUpViewController.swift
//  food-market-ios
//
//  Created by Mac 2020 on 13/05/25.
//

import UIKit

class SignUpViewController: BaseViewController {
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var photoProfileView: PhotoProfileView!
    @IBOutlet weak var fullNameInputTextField: InputTextField!
    @IBOutlet weak var emailInputTextField: InputTextField!
    @IBOutlet weak var passwordInputTextField: InputTextField!

    weak var presenter: SignUpViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        photoProfileView.delegate = self

        headerView.setupData(
            data: HeaderViewData(
                title: "Sign Up",
                subtitle: "Register and eat",
                showBackButton: true
            )
        )
        
        fullNameInputTextField.setupData(
            data: InputTextFieldData(
                label: "Full Name",
                placeholder: "Type your full name"
            )
        )
        
        emailInputTextField.setupData(
            data: InputTextFieldData(
                label: "Email Address",
                placeholder: "Type your email address"
            )
        )
        
        passwordInputTextField.setupData(
            data: InputTextFieldData(
                label: "Password",
                placeholder: "Type your password",
                isSecure: true
            )
        )
    }
}

extension SignUpViewController: UploadPhotoProfileDelegate {
    func uploadPhotoViewDidTapUpload(_ view: PhotoProfileView) {
        let picker  = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.originalImage] as? UIImage {
            photoProfileView.setImage(image: image)
        }
        
        picker.dismiss(animated: true)
    }
}

extension SignUpViewController: SignUpPresenterToViewProtocol {
    
}
