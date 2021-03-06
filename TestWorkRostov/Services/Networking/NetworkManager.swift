//
//  NetworkManager.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

class NetworkManager {
    @discardableResult
    static func request(_ builder: URLBuilder,  completion: @escaping (Result<Data,Error>) -> Void) -> URLSessionDataTask? {
        guard let url = builder.build() else { return nil }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        
        return task
    }
    
}
