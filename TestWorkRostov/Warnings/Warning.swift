//
//  Warning.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 18.07.2021.
//

import Foundation

enum Warning {
    case doubleRequest
    
    var description: String {
        switch self {
        
        case .doubleRequest:
            return "You have already initialized downloading"
        }
    }
    
}
