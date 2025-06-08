//
//  Int+Extension.swift
//  food-market-ios
//
//  Created by Mac 2020 on 08/06/25.
//

import Foundation

extension Int {
    func toRupiah() -> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        formatter.currencySymbol = "IDR "
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "IDR \(self)"
    }
}
