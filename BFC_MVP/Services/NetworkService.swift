//
//  NetworkService.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 21.01.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func getProducts(completion: @escaping (Result<[BabyFoodCareModel]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getProducts(completion: @escaping (Result<[BabyFoodCareModel]?, Error>) -> Void) {
        let urlString = "https://davnopora.fun/kir/food"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([BabyFoodCareModel].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
