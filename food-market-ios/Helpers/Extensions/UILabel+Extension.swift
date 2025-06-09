//
//  UILabel+Extension.swift
//  food-market-ios
//
//  Created by Mac 2020 on 09/06/25.
//

import UIKit

extension UILabel {
    func setLineHeight(_ lineHeight: CGFloat) {
        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight

        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: self.font as Any,
            .foregroundColor: self.textColor as Any
        ]

        self.attributedText = NSAttributedString(string: labelText, attributes: attributes)
    }
}
