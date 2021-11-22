//
//  GetFiatsUseCase.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 22/11/21.
//

import Foundation

protocol GetFiatsUseCaseProtocol {
    func execute() -> Result<[Asset], DataRetrieverError>
}

final class GetFiatsUseCase: GetFiatsUseCaseProtocol {
    func execute() -> Result<[Asset], DataRetrieverError> {
        let result = MastrerDataService.shared.data
        switch result {
        case .failure(let error):
            return .failure(error)
        case .success(let data):
            let fiats: [Asset] = data.fiats.filter({$0.attributes.hasWallets}).map { item in
                return Asset(
                    name: item.attributes.name,
                    iconURL: item.attributes.logo,
                    darkIconURL: item.attributes.logoDark,
                    symbol: item.attributes.symbol
                )
            }
            return .success(fiats)
        }
    }
}
