//
//  AssetsViewModel.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class AssetsViewModel {
    
    private let getCryptocoinsUseCase: GetCryptocoinsUseCaseProtocol
    private let getCommoditiesUseCase: GetCommoditiesUseCaseProtocol
    private let getFiatsUseCase: GetFiatsUseCaseProtocol
    private let retryFetchDataUseCase: RetryFetchDataUseCaseProtocol
    
    private(set) var cryptocoins: [Commodity] = []
    private(set) var  commodities: [Commodity] = []
    private(set) var  fiats: [Asset] = []
    
    private(set) var showErrorPage: Bool = false
    private(set) var errorMessage: String = ""
    
    init(getCryptocoinsUseCase: GetCryptocoinsUseCaseProtocol,
         getCommoditiesUseCase: GetCommoditiesUseCaseProtocol,
         getFiatsUseCase: GetFiatsUseCaseProtocol,
         retryFetchDataUseCase: RetryFetchDataUseCaseProtocol
    ) {
        self.getCryptocoinsUseCase = getCryptocoinsUseCase
        self.getCommoditiesUseCase = getCommoditiesUseCase
        self.getFiatsUseCase = getFiatsUseCase
        self.retryFetchDataUseCase = retryFetchDataUseCase
        loadData()
    }
    
    public func retryLoadData() {
        retryFetchDataUseCase.execute()
        loadData()
    }
    
    private func loadData() {
        showErrorPage = false
        errorMessage = ""
        
        switch getCryptocoinsUseCase.execute() {
        case .failure(let error):
            showErrorPage = true
            errorMessage = getErrorMessage(error)
        case .success(let data):
            cryptocoins = data
        }
        switch getCommoditiesUseCase.execute() {
        case .failure(let error):
            showErrorPage = true
            errorMessage = getErrorMessage(error)
        case .success(let data):
            commodities = data
        }
        switch getFiatsUseCase.execute() {
        case .failure(let error):
            showErrorPage = true
            errorMessage = getErrorMessage(error)
        case .success(let data):
            fiats = data
        }
    }
    
    private func getErrorMessage(_ error: DataRetrieverError) -> String {
        switch error.errorType {
        case .jsonNotFound:
            return "The asset data wasn't found"
        case .parseFailed:
            return "Couldn't load the information. The data was incorrect"
        case .unknown:
            return "Couldn't load the information."
        }
    }
}
