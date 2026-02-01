//
//  MovieRowView.swift
//  TmdbRestApiCase
//
//  Created by mustafaolmezses on 1.02.2026.
//

import SwiftUI

struct MovieRowView: View {

    let movie: Movie

    var body: some View {
        HStack(spacing: 12) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 90)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.overview)
                    .font(.caption)
                    .lineLimit(3)
            }

            Spacer()
        }
    }
}

//#Preview {
//    MovieRowView()
//}
