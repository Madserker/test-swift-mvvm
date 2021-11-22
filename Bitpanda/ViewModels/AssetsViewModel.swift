//
//  AssetsViewModel.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class AssetsViewModel {
    
    private let getCryptocoinsUseCase = GetCryptoCoinsUseCase()
    private let getCommoditiesUseCase = GetCommoditiesUseCase()
    private let getFiatsUseCase = GetFiatsUseCase()
    private let retryFetchDataUseCase = RetryFetchDataUseCase()
    
    var cryptocoins: [Commodity] = []
    var commodities: [Commodity] = []
    var fiats: [Asset] = []
    
    var showErrorPage: Bool = false
    var errorMessage: String = ""
    
    init() {
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
