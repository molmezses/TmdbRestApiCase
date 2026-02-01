//
//  Movie.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 31.01.2026.
//

import Foundation

struct Movie: Decodable , Identifiable, Equatable{
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String , CodingKey{
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
    
    
    
    
    
}
