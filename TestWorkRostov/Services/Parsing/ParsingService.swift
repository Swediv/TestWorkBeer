//
//  ParsingService.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation

class ParsingService {
    static func decode<T>(_ model: T.Type, fromData data: Data) -> Result<T, DecodeError> where T: Decodable {
        
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(.parsingError)
            
        }
    }
}
