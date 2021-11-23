//
//  Commodity.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 23/11/21.
//

import Foundation

class Commodity: Asset {
    var price: String
    
    init(name: String, iconURL: String, darkIconURL: String, price: String, symbol: String) {
        self.price = price
        super.init(name: name, iconURL: iconURL, darkIconURL: darkIconURL, symbol: symbol)
    }
}
