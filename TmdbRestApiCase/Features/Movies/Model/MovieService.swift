//
//  MovieService.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 31.01.2026.
//

import Foundation

protocol MovieServiceProtocol{
    func fetchPopularMovies(page: Int) async throws -> MovieResponse
}


final class MovieService: MovieServiceProtocol {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchPopularMovies(page: Int) async throws -> MovieResponse {
        try await apiClient.request(
            endpoint: MovieEndpoint.popular(page: page),
            //responseType -> DecodableType ister MovieRespınse -< Decodable
            responseType: MovieResponse.self
        )
        
    }
    
    
    
}

