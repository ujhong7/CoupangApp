//
//  Numeric+Extension.swift
//  CoupangApp
//
//  Created by yujaehong on 9/24/24.
//

import Foundation

extension Numeric {
    var moneyString: String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return (formatter.string(for: self) ?? "") + "원"
    }
}
