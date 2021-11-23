//
//  GetCryptocoinsParseFailUseCase.swift
//  BitpandaTests
//
//  Created by Sergi Hurtado on 23/11/21.
//

import Foundation
@testable import Bitpanda

final class GetCryptocoinsFailUseCase: GetCryptocoinsUseCaseProtocol {
    func execute() -> Result<[Commodity], DataRetrieverError> {
        return .failure(DataRetrieverError(.unknown))
    }
}

final class GetWalletsFailUseCase: GetWalletsUseCaseProtocol {
    func execute() -> Result<[Wallet], DataRetrieverError> {
        return .failure(DataRetrieverError(.unknown))
    }
}
