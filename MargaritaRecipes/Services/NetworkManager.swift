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
    case noImage
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")!
        case .noImage:
            return URL(string: "https://ic.pics.livejournal.com/tanjand/44781189/87235050/87235050_original.jpg")!
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
    
    
    func fetchDrinks(from url: URL, completion: @escaping(Result<[Drink], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                guard let statusCode = dataResponse.response?.statusCode else { return }
                print("STATUS CODE: ", statusCode)
                
                switch dataResponse.result {
                case .success(let data):
                    let drinks = Drink.getDrinks(from: data)
                    completion(.success(drinks))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func fetchDefaultImage(from url: URL, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }

}
