//
//  AssetsViewModel.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class AssetsViewModel {
    
    public func getCryptocoins() -> [Commodity] {
        let data = MastrerDataService.shared.getCryptocoins()
        let cryptocoins: [Commodity] = data.map { item in
            return Commodity(
                name: item.attributes.name,
                icon: item.attributes.logo,
                price: item.attributes.avgPrice,
                symbol: item.attributes.symbol
            )
        }
        return cryptocoins
    }
}
