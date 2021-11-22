//
//  GetCommodityWallets.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 22/11/21.
//

import Foundation

protocol GetCommodityWalletsUseCaseProtocol {
    func execute() -> Result<[Wallet], DataRetrieverError>
}

final class GetCommodityWalletsUseCase: GetCommodityWalletsUseCaseProtocol {
    func execute() -> Result<[Wallet], DataRetrieverError> {
        let result = MastrerDataService.shared.data
        switch result {
        case .failure(let error):
            return .failure(error)
        case .success(let data):
            let wallets: [Wallet] = data.commodityWallets.filter{!$0.attributes.deleted}.map { item in
                return Wallet(
                    name: item.attributes.name,
                    iconURL: MastrerDataService.shared.getWalletIcon(
                        isDark: false,
                        symbol: item.attributes.cryptocoinSymbol),
                    darkIconURL: MastrerDataService.shared.getWalletIcon(
                        isDark: true,
                        symbol: item.attributes.cryptocoinSymbol),
                    balance: item.attributes.balance.localizedNumber(),
                    symbol: item.attributes.cryptocoinSymbol,
                    isDefault: item.attributes.isDefault
                )
            }.sorted(by: {$0 > $1})
            return .success(wallets)
        }
    }
}
