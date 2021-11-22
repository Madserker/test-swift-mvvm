//
//  RetryReadDataUseCase.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 22/11/21.
//

import Foundation

protocol RetryFetchDataUseCaseProtocol {
    func execute() -> Void
}

final class RetryFetchDataUseCase: RetryFetchDataUseCaseProtocol {
    func execute() -> Void {
        MastrerDataService.shared.fetchData()
    }
}
