//
//  MovieListView.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 1.02.2026.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack{
            content
                .navigationTitle("Movies")
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

private extension MovieListView {
    var content: some View{
        Group {
            if viewModel.isLoading && viewModel.movies.isEmpty{
                ProgressView()
            }else if let error = viewModel.errorMessage{
                Text("\(error)")
            }else{
                movieList
            }
        }
    }
    
    var movieList: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.movies) { movie in
                    MovieRowView(movie: movie)
                        .onAppear {
                            if movie == viewModel.movies.last {
                                Task {
                                    await viewModel.fetchMovies()
                                }
                            }
                        }
                }

                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    MovieListView()
}
