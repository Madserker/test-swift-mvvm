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
