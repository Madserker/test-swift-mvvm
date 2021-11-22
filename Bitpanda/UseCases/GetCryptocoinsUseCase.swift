//
//  GetCryptocoins.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 22/11/21.
//

import Foundation

protocol GetCryptocoinsUseCaseProtocol {
    func execute() -> Result<[Commodity], DataRetrieverError>
}

final class GetCryptoCoinsUseCase: GetCryptocoinsUseCaseProtocol {
    func execute() -> Result<[Commodity], DataRetrieverError> {
        let result = MastrerDataService.shared.data
        switch result {
        case .failure(let error):
            return .failure(error)
        case .success(let data):
            let cryptocoins: [Commodity] = data.cryptocoins.map { item in
                return Commodity(
                    name: item.attributes.name,
                    iconURL: item.attributes.logo,
                    darkIconURL: item.attributes.logoDark,
                    price: item.attributes.avgPrice.localizedNumber(),
                    symbol: item.attributes.symbol
                )
            }
            return .success(cryptocoins)
        }
    }
}
