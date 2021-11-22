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
                iconURL: item.attributes.logo,
                darkIconURL: item.attributes.logoDark,
                price: item.attributes.avgPrice,
                symbol: item.attributes.symbol
            )
        }
        return cryptocoins
    }
    
    public func getCommodities() -> [Commodity] {
        let data = MastrerDataService.shared.getCommodities()
        let commodities: [Commodity] = data.map { item in
            return Commodity(
                name: item.attributes.name,
                iconURL: item.attributes.logo,
                darkIconURL: item.attributes.logoDark,
                price: item.attributes.avgPrice,
                symbol: item.attributes.symbol
            )
        }
        return commodities
    }
    
    public func getFiats() -> [Asset] {
        let data = MastrerDataService.shared.getFiats().filter({$0.attributes.hasWallets})
        let fiats: [Asset] = data.map { item in
            return Asset(
                name: item.attributes.name,
                iconURL: item.attributes.logo,
                darkIconURL: item.attributes.logoDark,
                symbol: item.attributes.symbol
            )
        }
        return fiats
        
    }
}
