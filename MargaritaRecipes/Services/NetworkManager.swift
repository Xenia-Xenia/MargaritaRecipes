//
//  NetworkManager.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
    }
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        
    }
}
