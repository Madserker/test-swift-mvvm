//
//  Wallet.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 23/11/21.
//

import Foundation

class Wallet: Asset, Comparable {
    var balance: String
    var isDefault: Bool = false
    
    init(name: String, iconURL: String, darkIconURL: String, balance: String, symbol: String, isDefault: Bool?) {
        self.balance = balance
        if let isDefaultSecure = isDefault {
            self.isDefault = isDefaultSecure
        }
        super.init(name: name, iconURL: iconURL, darkIconURL: darkIconURL, symbol: symbol)
    }
    
    static func < (lhs: Wallet, rhs: Wallet) -> Bool {
        return lhs.balance.localizedDouble() < rhs.balance.localizedDouble()
    }
    
    static func == (lhs: Wallet, rhs: Wallet) -> Bool {
        return lhs.balance.localizedDouble() == rhs.balance.localizedDouble()

    }
}
