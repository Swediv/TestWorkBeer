//
//  URLBuilder.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import Foundation
//https://api.punkapi.com/v2/beers?page=2&per_page=80

enum URLBuilder {
    case forLoading(page: String?, countPerPage: String?)
    
    var queryItems: [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        
        switch self {
        case let .forLoading(page: page, countPerPage: countPerPage):
            if let page = page {
                queryItems.append(URLQueryItem(name: "page", value: page))
            }
            
            if let countPerPage = countPerPage {
                queryItems.append(URLQueryItem(name: "per_page", value: countPerPage))
            }
        }
        return queryItems
    }
    
    var path: String {
        switch self {
        
        case .forLoading:
            return "/v2/beers"
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
