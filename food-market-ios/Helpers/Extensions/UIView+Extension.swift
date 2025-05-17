//
//  UIView+Extension.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import UIKit

extension UIView {
    func addDashedBorder(color: UIColor = ColorConstant.primaryGray, dashPattern: [NSNumber] = [16, 10]) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = dashPattern
        shapeLayer.fillColor = nil
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        shapeLayer.frame = self.bounds
        self.layer.addSublayer(shapeLayer)
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func roundedFull() {
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
    }
}
