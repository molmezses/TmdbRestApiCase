//
//  MovieEndpoint.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 31.01.2026.
//

import Foundation

enum MovieEndpoint: Endpoint{    
    
    case popular(page: Int)
    case detail(id: Int)
    case search(query: String , page: Int)
    
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        case .detail(let id):
            return "/movie/\(id)"
        case .search:
            return "/search/movie"
        }
    }
    
    var method: HTTPMethod{
        return .get
    }
    
    var queryItems: [URLQueryItem]? {
        var items = [
            URLQueryItem(
                name: "api_key",
                value: Configuration.tmdbApiKey
            )
        ]
        
        switch self {
        case .popular(let page):
            items.append(URLQueryItem(name: "page", value: "\(page)"))
        case .search(let query, let page):
            items.append(URLQueryItem(name: "query", value: "\(query)"))
            items.append(URLQueryItem(name: "page", value: "\(page)"))
        case .detail:
                break
        }
        
        return items
        
    }
    
}
