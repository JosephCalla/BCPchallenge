//
//  CurrencyServices.swift
//  BCPchallenge
//
//  Created by Joseph Calla Moreyra on 22/02/21.
//

import Foundation
import Alamofire

class CurrencyService {
    //    private let apiManager : APIManager
    let baseURL = "https://13fe9f44-25b8-4a5b-b3d1-0413b8b8ae20.mock.pstmn.io"
    
    func getListCurrency(completion: @escaping (Result<[CurrencyResponse], Error>) -> Void) {
        
        AF.request("\(baseURL)/getBuyCurrency",method: .get,
                   parameters: nil).validate().response { (response) in
                    guard let data = response.data else {return}
                    do{
                        
                        let jsonData = try JSONDecoder().decode([CurrencyResponse].self, from: data)
                        completion(.success(jsonData))
//                        DispatchQueue.main.async {
//                            completion(.success(jsonData))
//                        }
                    }catch{
                        print("error", error.localizedDescription)
                    }
                   }.resume()
    }
}
