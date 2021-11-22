//
//  CodableModels.swift
//  Bitpanda
//
//  Created by Sergi Hurtado on 20/11/21.
//

import Foundation

// MARK: - CodableResponseModel
struct CodableResponseModel: Codable {
    let data: CodableData
}

// MARK: - CodableData
struct CodableData: Codable {
    let type: String
    let attributes: CodableDataAttributes
}

// MARK: - CodableDataAttributes
struct CodableDataAttributes: Codable {
    let cryptocoins, commodities: [CodableCommodity]
    let fiats: [CodableFiat]
    let wallets, commodityWallets: [CodableWallet]
    let fiatwallets: [CodableFiatwallet]

    enum CodingKeys: String, CodingKey {
        case cryptocoins, commodities, fiats, wallets, fiatwallets
        case commodityWallets = "commodity_wallets"
    }
}

// MARK: - CodableCommodity
struct CodableCommodity: Codable {
    let type: CodableAssetTypeNameEnum
    let attributes: CodableCommodityAttributes
    let id: String
}

// MARK: - CodableCommodityAttributes
struct CodableCommodityAttributes: Codable {
    let symbol, name: String
    let sort: Int
    let assetTypeName: CodableAssetTypeNameEnum
    let assetGroupName: CodableAssetGroupName
    let urlCheckAddress, urlCheckTransaction: String
    let buyActive, sellActive, withdrawActive, depositActive: Bool
    let transferActive, available, maintenanceEnabled: Bool
    let minBuyEur, minSellEur, minWithdrawEur, defaultSellAmount: String
    let precisionForFiatPrice, precisionForCoins, precisionForTx: Int
    let walletMinDeposit, walletSmallDeposit, walletSmallDepositFee, avgPrice: String
    let color, walletWithdrawFee, change24H, change24HAmount: String
    let change1W, change1WAmount, change1M, change1MAmount: String
    let change1Y, change1YAmount: String
    let logo, logoDark: String
    let supportDestinationTag: Bool
    let circulatingSupply: String?
    let allowedUnverified, allowedDocumented, allowedVerified: Bool
    let measurementUnit: String?
    let info, unavailableReason, maintenanceReason, walletInfo: String
    let extraInfo, infoIntegration, infoDeu, infoEng: String
    let infoFra, unavailableReasonDeu, unavailableReasonEng, unavailableReasonFra: String
    let maintenanceReasonDeu, maintenanceReasonEng, maintenanceReasonFra, walletInfoDeu: String
    let walletInfoEng, walletInfoFra, extraInfoDeu, extraInfoEng: String
    let extraInfoFra, infoIntegrationDeu, infoIntegrationEng, infoIntegrationFra: String
    let investmentInfo, investmentInfoDeu, investmentInfoEng, investmentInfoFra: String?
    let androidSupportedVersion: String?
    let iosSupportedVersion: CodableIosSupportedVersion?
    let family: CodableFamily?

    enum CodingKeys: String, CodingKey {
        case symbol, name, sort
        case assetTypeName = "asset_type_name"
        case assetGroupName = "asset_group_name"
        case urlCheckAddress = "url_check_address"
        case urlCheckTransaction = "url_check_transaction"
        case buyActive = "buy_active"
        case sellActive = "sell_active"
        case withdrawActive = "withdraw_active"
        case depositActive = "deposit_active"
        case transferActive = "transfer_active"
        case available
        case maintenanceEnabled = "maintenance_enabled"
        case minBuyEur = "min_buy_eur"
        case minSellEur = "min_sell_eur"
        case minWithdrawEur = "min_withdraw_eur"
        case defaultSellAmount = "default_sell_amount"
        case precisionForFiatPrice = "precision_for_fiat_price"
        case precisionForCoins = "precision_for_coins"
        case precisionForTx = "precision_for_tx"
        case walletMinDeposit = "wallet_min_deposit"
        case walletSmallDeposit = "wallet_small_deposit"
        case walletSmallDepositFee = "wallet_small_deposit_fee"
        case avgPrice = "avg_price"
        case color
        case walletWithdrawFee = "wallet_withdraw_fee"
        case change24H = "change_24h"
        case change24HAmount = "change_24h_amount"
        case change1W = "change_1w"
        case change1WAmount = "change_1w_amount"
        case change1M = "change_1m"
        case change1MAmount = "change_1m_amount"
        case change1Y = "change_1y"
        case change1YAmount = "change_1y_amount"
        case logo
        case logoDark = "logo_dark"
        case supportDestinationTag = "support_destination_tag"
        case circulatingSupply = "circulating_supply"
        case allowedUnverified = "allowed_unverified"
        case allowedDocumented = "allowed_documented"
        case allowedVerified = "allowed_verified"
        case measurementUnit = "measurement_unit"
        case info
        case unavailableReason = "unavailable_reason"
        case maintenanceReason = "maintenance_reason"
        case walletInfo = "wallet_info"
        case extraInfo = "extra_info"
        case infoIntegration = "info_integration"
        case infoDeu = "info_deu"
        case infoEng = "info_eng"
        case infoFra = "info_fra"
        case unavailableReasonDeu = "unavailable_reason_deu"
        case unavailableReasonEng = "unavailable_reason_eng"
        case unavailableReasonFra = "unavailable_reason_fra"
        case maintenanceReasonDeu = "maintenance_reason_deu"
        case maintenanceReasonEng = "maintenance_reason_eng"
        case maintenanceReasonFra = "maintenance_reason_fra"
        case walletInfoDeu = "wallet_info_deu"
        case walletInfoEng = "wallet_info_eng"
        case walletInfoFra = "wallet_info_fra"
        case extraInfoDeu = "extra_info_deu"
        case extraInfoEng = "extra_info_eng"
        case extraInfoFra = "extra_info_fra"
        case infoIntegrationDeu = "info_integration_deu"
        case infoIntegrationEng = "info_integration_eng"
        case infoIntegrationFra = "info_integration_fra"
        case investmentInfo = "investment_info"
        case investmentInfoDeu = "investment_info_deu"
        case investmentInfoEng = "investment_info_eng"
        case investmentInfoFra = "investment_info_fra"
        case androidSupportedVersion = "android_supported_version"
        case iosSupportedVersion = "ios_supported_version"
        case family
    }
}

enum CodableAssetGroupName: String, Codable {
    case coin = "coin"
    case metal = "metal"
}

enum CodableAssetTypeNameEnum: String, Codable {
    case commodity = "commodity"
    case cryptocoin = "cryptocoin"
}

enum CodableFamily: String, Codable {
    case eth = "ETH"
    case neo = "NEO"
}

// MARK: - CodableIeoPhase
struct CodableIeoPhase: Codable {
    let type: String
    let attributes: CodableIeoPhaseAttributes
    let id: String
}

// MARK: - CodableIeoPhaseAttributes
struct CodableIeoPhaseAttributes: Codable {
    let name: String
    let phaseNumber: Int
    let startDate, endDate: CodableDate
    let maxStock, price: String
    let active: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case phaseNumber = "phase_number"
        case startDate = "start_date"
        case endDate = "end_date"
        case maxStock = "max_stock"
        case price, active
    }
}

// MARK: - CodableDate
struct CodableDate: Codable {
    let dateIso8601: Date
    let unix: String

    enum CodingKeys: String, CodingKey {
        case dateIso8601 = "date_iso8601"
        case unix
    }
}

enum CodableIosSupportedVersion: String, Codable {
    case the100 = "1.0.0"
    case the101 = "1.0.1"
}

// MARK: - CodableWallet
struct CodableWallet: Codable {
    let type: CodableCommodityWalletType
    let attributes: CodableCommodityWalletAttributes
    let id: String
}

// MARK: - CodableCommodityWalletAttributes
struct CodableCommodityWalletAttributes: Codable {
    let cryptocoinID, cryptocoinSymbol, balance: String
    let isDefault: Bool
    let name: String
    let pendingTransactionsCount: Int
    let deleted: Bool

    enum CodingKeys: String, CodingKey {
        case cryptocoinID = "cryptocoin_id"
        case cryptocoinSymbol = "cryptocoin_symbol"
        case balance
        case isDefault = "is_default"
        case name
        case pendingTransactionsCount = "pending_transactions_count"
        case deleted
    }
}

enum CodableCommodityWalletType: String, Codable {
    case wallet = "wallet"
}

// MARK: - CodableFiat
struct CodableFiat: Codable {
    let type: String
    let attributes: CodableFiatAttributes
    let id: String
}

// MARK: - CodableFiatAttributes
struct CodableFiatAttributes: Codable {
    let symbol, name: String
    let precision: Int
    let toEurRate, defaultSellAmount, numericCharacterReference, minWithdrawEuro: String
    let symbolCharacter: String
    let hasWallets: Bool
    let logo, logoDark, logoWhite, logoColor: String
    let nameDeu, nameEng, nameFra: String

    enum CodingKeys: String, CodingKey {
        case symbol, name, precision
        case toEurRate = "to_eur_rate"
        case defaultSellAmount = "default_sell_amount"
        case numericCharacterReference = "numeric_character_reference"
        case minWithdrawEuro = "min_withdraw_euro"
        case symbolCharacter = "symbol_character"
        case hasWallets = "has_wallets"
        case logo
        case logoDark = "logo_dark"
        case logoWhite = "logo_white"
        case logoColor = "logo_color"
        case nameDeu = "name_deu"
        case nameEng = "name_eng"
        case nameFra = "name_fra"
    }
}

// MARK: - CodableFiatwallet
struct CodableFiatwallet: Codable {
    let type: String
    let attributes: CodableFiatwalletAttributes
    let id: String
}

// MARK: - CodableFiatwalletAttributes
struct CodableFiatwalletAttributes: Codable {
    let fiatID, fiatSymbol, balance, name: String
    let pendingTransactionsCount: Int

    enum CodingKeys: String, CodingKey {
        case fiatID = "fiat_id"
        case fiatSymbol = "fiat_symbol"
        case balance, name
        case pendingTransactionsCount = "pending_transactions_count"
    }
}
