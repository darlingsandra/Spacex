//
//  NetworkManager.swift
//  Spacex
//
//  Created by Александра Широкова on 14.04.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum API: String {
    case rocketsURL = "https://api.spacexdata.com/v4/rockets"
}

class NetworkManager {
  
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(dataType: T.Type, from url: String, with completion: @escaping(Result<[T], NetworkError>)-> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
        
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let type = try decoder.decode([T].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
    
    func fetchImage(from url: String) -> Data? {
        guard let url = URL(string: url) else { return nil }
        return try? Data(contentsOf: url)
    }
}
