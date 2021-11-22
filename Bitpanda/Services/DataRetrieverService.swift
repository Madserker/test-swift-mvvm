//
//  DataRetrieverService.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

class DataRetrieverError: Error {
    enum ErrorType {
        case jsonNotFound
        case parseFailed
        case unknown
    }
    
    final let errorType: ErrorType
    
    public init(_ error: ErrorType) {
      self.errorType = error
    }
}

class DataRetrieverService {
    
    public static func fetchData<T: Codable>(type: T.Type, resourceName: String) -> Result<T,DataRetrieverError> {
        if let path = Bundle.main.path(forResource: resourceName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let result = try JSONDecoder().decode(T.self, from: data)
                
                return .success(result)
            } catch {
                return .failure(DataRetrieverError(.parseFailed))
            }
        }
        return .failure(DataRetrieverError(.jsonNotFound))
    }
}
