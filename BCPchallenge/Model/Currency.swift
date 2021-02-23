//
//  Currency.swift
//  BCPchallenge
//
//  Created by Joseph Calla Moreyra on 21/02/21.
//

import Foundation

struct CurrencyResponse: Codable{
    let country: String
    let description: String
    let image: String?
    let symbol: String
    let rate: Double
    let sell: Double
    let buy: Double
}

enum Money: String, Codable{
    case EUR
    case USD
    case JPY
    case GBP
    case CHF
    case CAD
    case PEN
}
