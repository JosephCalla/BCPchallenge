//
//  Constants.swift
//  BCPchallenge
//
//  Created by Joseph Calla Moreyra on 22/02/21.
//

import Foundation

class Constants {

    // MARK: - Alerts
    
    static let defaultAlertTitle = "Opps!"
    static let errorAlertTitle = "error"
    static let genericErrorMessage = "Algo pasó, vuelva a intentarlo por favor."

}
extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

