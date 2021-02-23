//
//  ListCurrencyViewModel.swift
//  BCPchallenge
//
//  Created by Joseph Calla Moreyra on 22/02/21.
//

import Foundation
class ListCurrencyViewModel {
    private var apiService = CurrencyService()
    var currencyArray = [CurrencyResponse]()
    
    func fetchCurrency(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getListCurrency() { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.currencyArray = listOf
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if currencyArray.count != 0 {
            return currencyArray.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> CurrencyResponse {
        return currencyArray[indexPath.row]
    }
}
