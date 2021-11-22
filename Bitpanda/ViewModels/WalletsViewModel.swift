//
//  WalletsViewModel.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class WalletViewModel {
    
    var assets: [CodableCommodity]
    var fiats: [CodableFiat]
    
    init() {
        assets = MastrerDataService.shared.getCryptocoins()
        assets.append(contentsOf: MastrerDataService.shared.getCommodities())
        fiats = MastrerDataService.shared.getFiats()
    }
    
    public func getFiatWallets() -> [Wallet] {
        let data = MastrerDataService.shared.getFiatWallets()
        let fiatWallets: [Wallet] = data.map { item in
            return Wallet(
                name: item.attributes.name,
                iconURL: getWalletIcon(
                    isDark: false,
                    symbol: item.attributes.fiatSymbol),
                darkIconURL: getWalletIcon(
                    isDark: true,
                    symbol: item.attributes.fiatSymbol),
                balance: item.attributes.balance,
                symbol: item.attributes.fiatSymbol,
                isDefault: false
            )
        }
        return fiatWallets
    }
    
    public func getWallets() -> [Wallet] {
        let data = MastrerDataService.shared.getWallets().filter({!$0.attributes.deleted})
        let wallets: [Wallet] = data.map { item in
            return Wallet(
                name: item.attributes.name,
                iconURL: getWalletIcon(
                    isDark: false,
                    symbol: item.attributes.cryptocoinSymbol),
                darkIconURL: getWalletIcon(
                    isDark: true,
                    symbol: item.attributes.cryptocoinSymbol),
                balance: item.attributes.balance,
                symbol: item.attributes.cryptocoinSymbol,
                isDefault: item.attributes.isDefault
            )
        }
        return wallets
    }
    
    public func getCommodityWallets() -> [Wallet] {
        let data = MastrerDataService.shared.getCommodityWallets().filter({!$0.attributes.deleted})
        let commodityWallets: [Wallet] = data.map { item in
            return Wallet(
                name: item.attributes.name,
                iconURL: getFiatWalletIcon(
                    isDark: false,
                    symbol: item.attributes.cryptocoinSymbol),
                darkIconURL: getFiatWalletIcon(
                    isDark: true,
                    symbol: item.attributes.cryptocoinSymbol),
                balance: item.attributes.balance,
                symbol: item.attributes.cryptocoinSymbol,
                isDefault: item.attributes.isDefault
            )
        }
        return commodityWallets
    }
    
    private func getWalletIcon(isDark: Bool, symbol: String) -> String {
        var logo: String = ""
        assets.forEach { asset in
            if asset.attributes.symbol == symbol {
                logo = isDark ? asset.attributes.logoDark : asset.attributes.logo
                return
            }
        }
        return logo
    }
    
    private func getFiatWalletIcon(isDark: Bool, symbol: String) -> String {
        var logo: String = ""
        fiats.forEach { fiat in
            if fiat.attributes.symbol == symbol {
                logo = isDark ? fiat.attributes.logoDark : fiat.attributes.logo
                return
            }
        }
        return logo
    }
}
