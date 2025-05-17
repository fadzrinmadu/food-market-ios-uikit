//
//  PhotoProfileView.swift
//  food-market-ios
//
//  Created by Mac 2020 on 17/05/25.
//

import UIKit

protocol UploadPhotoProfileDelegate: AnyObject {
    func uploadPhotoViewDidTapUpload(_ view: PhotoProfileView)
}

class PhotoProfileView: UIView {
    @IBOutlet weak var dashedLineView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addPhotoLabel: UILabel!
    
    weak var delegate: UploadPhotoProfileDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func setImage(image: UIImage) {
        photoImageView.image = image
        photoImageView.isHidden = false
        addPhotoLabel.isHidden = true
    }
    
    private func commonInit() {
        guard let view = self.loadViewFromNib(nibName: "PhotoProfileView") else { return }
        view.frame = self.bounds
        self.addSubview(view)

        dashedLineView.roundedFull()
        dashedLineView.addDashedBorder()
        imageView.roundedFull()
        photoImageView.isHidden = true
        addPhotoLabel.font = FontConstant.poppinsLightSmall
        
        let dashedLineViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        dashedLineView.addGestureRecognizer(dashedLineViewTapGesture)
    }
    
    @objc
    private func openGallery() {
        delegate?.uploadPhotoViewDidTapUpload(self)
    }
}
