//
//  MasterDataService.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class MastrerDataService {
     
    static let shared = MastrerDataService()
    
    var data: CodableDataAttributes?
    
    private init() {
        let response =
            DataRetrieverService.fetchData(type: CodableResponseModel.self, resourceName: "Mastrerdata")
        switch response {
        case .failure(let error):
            print(error.errorType)
            break
        
        case .success(let data):
            self.data = data.data.attributes
            break
        }
    }
    
    public func getCryptocoins() -> [CodableCommodity] {
        return data?.cryptocoins ?? []
    }
    
    public func getCommodities() -> [CodableCommodity] {
        return data?.commodities ?? []
    }
    
    public func getFiats() -> [CodableFiat] {
        return data?.fiats ?? []
    }
    
    public func getWallets() -> [CodableWallet] {
        return data?.wallets ?? []
    }
    
    public func getCommodityWallets() -> [CodableWallet] {
        return data?.commodityWallets ?? []
    }
    
    public func getFiatWallets() -> [CodableFiatwallet] {
        return data?.fiatwallets ?? []
    }
}
