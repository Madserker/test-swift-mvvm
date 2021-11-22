//
//  Commodity.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class Asset {
    let name: String
    let iconURL: String
    let darkIconURL: String
    let symbol: String
    
    init(name: String, iconURL: String, darkIconURL: String, symbol: String) {
        self.name = name
        self.iconURL = iconURL
        self.darkIconURL = darkIconURL
        self.symbol = symbol
    }
}

class Commodity: Asset {
    var price: String
    
    init(name: String, iconURL: String, darkIconURL: String, price: String, symbol: String) {
        self.price = price
        super.init(name: name, iconURL: iconURL, darkIconURL: darkIconURL, symbol: symbol)
    }
}

class Wallet: Asset {
    var balance: String
    var isDefault: Bool = false
    
    init(name: String, iconURL: String, darkIconURL: String, balance: String, symbol: String, isDefault: Bool?) {
        self.balance = balance
        if let isDefaultSecure = isDefault {
            self.isDefault = isDefaultSecure
        }
        super.init(name: name, iconURL: iconURL, darkIconURL: darkIconURL, symbol: symbol)
    }
}
