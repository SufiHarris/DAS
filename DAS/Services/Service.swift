//
//  Service.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import SwiftUI
import Foundation

enum ServiceError: Error {
    case networkError(String)
    case noData
    case invalidResponse(Int)
}

class Service {
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        var request = URLRequest(url: url)
        request.setValue("Bearer \(Infos().token ?? "")", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                // Handle network errors
                completion(.failure(ServiceError.networkError(error.localizedDescription)))
                return
            }
            
            // Check HTTP response status codes
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ServiceError.invalidResponse(-1))) // Unknown response
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ServiceError.invalidResponse(httpResponse.statusCode)))
                return
            }
            
            // Check if data is available
            guard let data = data else {
                completion(.failure(ServiceError.noData))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
