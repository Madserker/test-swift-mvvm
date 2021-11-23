//
//  BitpandaTests.swift
//  BitpandaTests
//
//  Created by Sergi Hurtado on 20/11/21.
//

import XCTest
@testable import Bitpanda

class BitpandaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCryptocoinsFailed() {
        let viewModel = AssetsViewModel(
            getCryptocoinsUseCase: GetCryptocoinsFailUseCase(),
            getCommoditiesUseCase: GetCommoditiesUseCase(),
            getFiatsUseCase: GetFiatsUseCase(),
            retryFetchDataUseCase: RetryFetchDataUseCase())
        
        XCTAssert(viewModel.showErrorPage)
        
        viewModel.retryLoadData()
        
        XCTAssert(viewModel.showErrorPage)
    }
    
    func testGetWalletsFailed() {
        let viewModel = WalletsViewModel(
            getWalletsUseCase: GetWalletsFailUseCase(),
            getCommodityWalletsUseCase: GetCommodityWalletsUseCase(),
            getFiatWalletsUseCase: GetFiatWalletsUseCase(),
            retryFetchDataUseCase: RetryFetchDataUseCase()
        )
        
        XCTAssert(viewModel.showErrorPage)
        
        viewModel.retryLoadData()
        
        XCTAssert(viewModel.showErrorPage)
    }
}
