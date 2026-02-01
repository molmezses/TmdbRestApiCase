//
//  MovieListViewModel.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 1.02.2026.
//

import Foundation
import Combine

@MainActor
final class MovieListViewModel: ObservableObject {

    @Published private(set) var movies: [Movie] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    private let movieService: MovieServiceProtocol

    private var currentPage = 1
    private var totalPages = 1

    init(movieService: MovieServiceProtocol = MovieService()) {
        self.movieService = movieService
    }
    
    
    
}

extension MovieListViewModel {

    func fetchMovies() async {
        guard !isLoading, currentPage <= totalPages else { return }

        isLoading = true
        errorMessage = nil

        do {
            let response = try await movieService.fetchPopularMovies(
                page: currentPage
            )

            movies.append(contentsOf: response.results)
            totalPages = response.totalPages
            currentPage += 1

        } catch {
            errorMessage = "Failed to load movies"
        }

        isLoading = false
    }
}


