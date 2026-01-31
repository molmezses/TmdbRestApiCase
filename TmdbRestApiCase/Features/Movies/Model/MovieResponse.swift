//
//  MovieResponse.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 31.01.2026.
//

import Foundation

struct MovieResponse: Decodable{
    let page : Int
    let results : [Movie]
    let totalPages: Int
    
    enum CodingKeys: String , CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
}
