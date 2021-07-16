//
//  URLBuilder.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation
//https://api.punkapi.com/v2/beers?page=2&per_page=80

enum URLBuilder {
    case forLoading
    
    var queryItems: [URLQueryItem] {
        switch self {
        
        case .forLoading:
            <#code#>
        }
    }
    
    var path: String {
        switch self {
        
        case .forLoading:
            return "v2/beers"
        }
    }
    
    func build() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.punkapi.com"
        components.path = path
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        return components.url
    }
    
    
}
