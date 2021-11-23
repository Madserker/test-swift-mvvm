//
//  MasterDataService.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class MastrerDataService {
     
    static let shared = MastrerDataService()
    
    private(set) var data: Result<CodableDataAttributes, DataRetrieverError>
    
    private init() {
        self.data = .failure(DataRetrieverError(.unknown))
        fetchData()
    }
    
    public func fetchData() {
        let response = DataRetrieverService.fetchData(
            type: CodableResponseModel.self,
            resourceName: "Mastrerdata")
        
        switch response {
        case .failure(let error):
            self.data = .failure(error)
            break
        
        case .success(let data):
            self.data = .success(data.data.attributes)
            break
        }
    }
    
    public func getWalletIcon(isDark: Bool, symbol: String) -> String {
        var logo: String = ""
        switch data {
        case .success(let secureData):
            var assets = secureData.cryptocoins
            assets.append(contentsOf: secureData.commodities)
            assets.forEach { asset in
                if asset.attributes.symbol == symbol {
                    logo = isDark ? asset.attributes.logoDark : asset.attributes.logo
                    return
                }
            }
            return logo
        case .failure(_):
            return logo
        }
    }
    
    public func getFiatWalletIcon(isDark: Bool, symbol: String) -> String {
        var logo: String = ""
        switch data {
        case .success(let secureData):
            secureData.fiats.forEach { fiat in
                if fiat.attributes.symbol == symbol {
                    logo = isDark ? fiat.attributes.logoDark : fiat.attributes.logo
                    return
                }
            }
            return logo
        case .failure(_):
            return logo
        }
    }
}
