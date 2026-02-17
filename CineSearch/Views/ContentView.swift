//
//  ContentView.swift
//  CineSearch
//
//  Created by Cem Akkaya on 17/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var networkManager = NetworkManager()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(networkManager.movies) { movie in
                        MovieCard(movie: movie)
                    }
                }
                .padding()
            }
            .navigationTitle("CineSearch")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await networkManager.fetchMovies()
            }
        }
    }
}

#Preview {
    ContentView()
}
