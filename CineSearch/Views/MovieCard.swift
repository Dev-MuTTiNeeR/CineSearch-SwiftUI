//
//  MovieCard.swift
//  CineSearch
//
//  Created by Cem Akkaya on 17/02/26.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: movie.posterURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .layoutPriority(-1)
                case .failure(let error):
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                    Text("Error: \(error.localizedDescription)")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 160)
            .cornerRadius(12)
            .clipped()
            
            Text(movie.originalTitle)
                .font(.caption)
                .fontWeight(.semibold)
                .lineLimit(2)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
                .frame(height: 32)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let dummyMovie = Movie(id: 1,
                           originalTitle: "Test Movie Title",
                           overview: "",
                           posterPath: "/psssss81238712361283712SAda.jpg",
                           releaseDate: "2023-01-01",
                           voteAverage: 0.5
                          )
    MovieCard(movie: dummyMovie)
}
