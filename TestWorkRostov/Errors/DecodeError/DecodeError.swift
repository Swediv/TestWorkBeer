//
//  DecodeError.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 18.07.2021.
//

import Foundation

enum DecodeError: Error {
    case parsingError
}

extension DecodeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        
        case .parsingError:
            return "Parsing into model failed"
        }
    }
}
