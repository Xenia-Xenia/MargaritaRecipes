//
//  NetworkManager.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import Foundation
import Alamofire

enum Link {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")!
        }
    }
}
   
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchDrinks() {
        AF.request(Link.baseURL.url)
            .validate()
            .responseJSON { dataResponse in
                guard let statusCode = dataResponse.response?.statusCode else { return }
                
                print("STATUS CODE: ", statusCode)
                
                if (200..<300).contains(statusCode) {
                    guard let value = dataResponse.value else { return }
                    print("VALUE: ", value)
                    return
                }
                
                guard let error = dataResponse.error else { return }
                print(error)
            }
    }
    
    
}
