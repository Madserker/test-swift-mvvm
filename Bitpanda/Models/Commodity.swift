//
//  Commodity.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class Commodity {
    var name: String
    var icon: String
    var price: String
    var symbol: String
    
    init(name: String, icon: String, price: String, symbol: String) {
        self.name = name
        self.icon = icon
        self.price = price
        self.symbol = symbol
    }
}
