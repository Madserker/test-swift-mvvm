//
//  WalletsViewModel.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class WalletsViewModel {
    
    private let getWalletsUseCase: GetWalletsUseCaseProtocol
    private let getCommodityWalletsUseCase: GetCommodityWalletsUseCaseProtocol
    private let getFiatWalletsUseCase: GetFiatWalletsUseCaseProtocol
    private let retryFetchDataUseCase: RetryFetchDataUseCaseProtocol
    
    private(set) var wallets: [Wallet] = []
    private(set) var commodityWallets: [Wallet] = []
    private(set) var fiatWallets: [Wallet] = []
    
    private(set) var showErrorPage: Bool = false
    private(set) var errorMessage: String = ""
    
    init(getWalletsUseCase: GetWalletsUseCaseProtocol,
         getCommodityWalletsUseCase: GetCommodityWalletsUseCaseProtocol,
         getFiatWalletsUseCase: GetFiatWalletsUseCaseProtocol,
         retryFetchDataUseCase: RetryFetchDataUseCaseProtocol
    ) {
        self.getWalletsUseCase = getWalletsUseCase
        self.getCommodityWalletsUseCase = getCommodityWalletsUseCase
        self.getFiatWalletsUseCase = getFiatWalletsUseCase
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
        switch getFiatWalletsUseCase.execute() {
        case .failure(let error):
            showErrorPage = true
            errorMessage = getErrorMessage(error)
        case .success(let data):
            fiatWallets = data
        }
    }
    
    private func getErrorMessage(_ error: DataRetrieverError) -> String {
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
