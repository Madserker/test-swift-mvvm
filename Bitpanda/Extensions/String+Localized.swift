//
//  String+LocalizedPrice.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 22/11/21.
//

import Foundation

extension String {
    func localizedNumber() -> String {
        let formatter = NumberFormatter()
        if let number: Double = Double(self) {
            formatter.numberStyle = .decimal
            formatter.locale = .autoupdatingCurrent
            return formatter.string(from: NSNumber(value: number)) ?? "-"
        } else {
            return "-"
        }
    }
    
    func localizedDouble() -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = .autoupdatingCurrent
        
        return formatter.number(from: self)?.doubleValue ?? 0.0
    }
}
