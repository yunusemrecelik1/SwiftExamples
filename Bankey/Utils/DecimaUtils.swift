//
//  DecimaUtils.swift
//  Bankey
//
//  Created by Yunus Emre Çelik on 24.09.2022.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
