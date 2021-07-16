//
//  NetworkManager.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

class NetworkManager {
    @discardableResult
    func request(_ builder: URLBuilder,  completion: @escaping (Result<Data,Error>) -> Void) -> URLSessionTask? {
        guard let url = builder.build() else { return nil}
        debugPrint("NetworkManager: URLBuilder: \(url)")
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                debugPrint("NetworkManager: error: \(error)")
                completion(.failure(error))
            }
            
            if let data = data {
                debugPrint("NetworkManager: succes")
                completion(.success(data))
            }
        }
        task.resume()
        
        return task
    }
    
}