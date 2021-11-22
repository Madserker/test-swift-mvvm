//
//  GetFiatWalletsUseCase.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 22/11/21.
//

import Foundation

protocol GetFiatWalletsUseCaseProtocol {
    func execute() -> Result<[Wallet], DataRetrieverError>
}

final class GetFIatWalletsUseCase: GetFiatWalletsUseCaseProtocol {
    func execute() -> Result<[Wallet], DataRetrieverError> {
        let result = MastrerDataService.shared.data
        switch result {
        case .failure(let error):
            return .failure(error)
        case .success(let data):
            let wallets: [Wallet] = data.fiatwallets.map { item in
                return Wallet(
                    name: item.attributes.name,
                    iconURL: MastrerDataService.shared.getFiatWalletIcon(
                        isDark: false,
                        symbol: item.attributes.fiatSymbol),
                    darkIconURL: MastrerDataService.shared.getFiatWalletIcon(
                        isDark: true,
                        symbol: item.attributes.fiatSymbol),
                    balance: item.attributes.balance.localizedNumber(),
                    symbol: item.attributes.fiatSymbol,
                    isDefault: false
                )
            }.sorted(by: {$0 > $1})
            return .success(wallets)
        }
    }
}
