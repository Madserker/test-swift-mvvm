//
//  WalletsViewModel.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class WalletsViewModel {
    
    private let getWalletsUseCase = GetWalletsUseCase()
    private let getCommodityWalletsUseCase = GetCommodityWalletsUseCase()
    private let getFiatsWalletsUseCase = GetFIatWalletsUseCase()
    private let retryFetchDataUseCase = RetryFetchDataUseCase()
    
    var wallets: [Wallet] = []
    var commodityWallets: [Wallet] = []
    var fiatWallets: [Wallet] = []
    
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
        
        switch getWalletsUseCase.execute() {
        case .failure(let error):
            showErrorPage = true
            errorMessage = getErrorMessage(error)
        case .success(let data):
            wallets = data
        }
        switch getCommodityWalletsUseCase.execute() {
        case .failure(let error):
            showErrorPage = true
            errorMessage = getErrorMessage(error)
        case .success(let data):
            commodityWallets = data
        }
        switch getFiatsWalletsUseCase.execute() {
        case .failure(let error):
            showErrorPage = true
            errorMessage = getErrorMessage(error)
        case .success(let data):
            fiatWallets = data
        }
    }
    
    public func getErrorMessage(_ error: DataRetrieverError) -> String {
        switch error.errorType {
        case .jsonNotFound:
            return "The wallet data wasn't found"
        case .parseFailed:
            return "Couldn't load the information. The data was incorrect"
        case .unknown:
            return "Couldn't load the information."
        }
    }
}
