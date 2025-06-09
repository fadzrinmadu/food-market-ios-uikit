//
//  UIView+Extension.swift
//  food-market-ios
//
//  Created by Mac 2020 on 28/09/24.
//

import UIKit

extension UIView {
    enum BorderPosition {
        case top, bottom, left, right
    }
    
    func addAllBorders(color: UIColor, thickness: CGFloat) {
        addBorder(to: [.top, .bottom, .left, .right], color: color, thickness: thickness)
    }
    
    func addBorder(to edges: [BorderPosition], color: UIColor, thickness: CGFloat) {
        edges.forEach { position in
            let border: CALayer = CALayer()
            border.backgroundColor = color.cgColor

            switch position {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            case .bottom:
                border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            case .right:
                border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            }

            self.layer.addSublayer(border)
        }
    }
    
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
    
    func addShadow(
        color: UIColor = .black,
        opacity: Float = 0.2,
        offset: CGSize = CGSize(width: 0, height: 2),
        radius: CGFloat = 4,
        shouldRasterize: Bool = true
    ) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = shouldRasterize
        self.layer.rasterizationScale = UIScreen.main.scale
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

    func roundCorners(_ corners: UIRectCorner = .allCorners, radius: CGFloat) {
        layoutIfNeeded() // pastikan bounds valid
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundedFull() {
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
    }
}
