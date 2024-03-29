//
//  APIRequestDispatcher.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 25.01.2024.
//

import Foundation

enum APIRequestError: Error {
    case badUrl, noData
}

class APIRequestDispatcher {

    class func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
        var components = URLComponents() // 1
        components.host = apiRouter.host
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path
        components.queryItems = apiRouter.parameters
        
        guard let url = components.url else { throw APIRequestError.badUrl } // 2

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        urlRequest.addValue("2", forHTTPHeaderField: "x-api-version") // 3

        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in // 4
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }

                guard let data = data else {
                    return continuation.resume(with: .failure(APIRequestError.noData)) // 5
                }

                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async { // 6
                        return continuation.resume(with: .success(responseObject)) // 7
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}
