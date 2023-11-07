//
//  MovieListView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel : MovieListViewModel
    
    
    var body: some View {
        
            List{
                ForEach(viewModel.movies) { movie in
                    HStack {
                        
                        AsyncImage(url:URL(string: movie.artworkUrl100)) { image in
                            image.cornerRadius(5)
                                .shadow(radius: 7)
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading,spacing: 5){
                            Text(movie.trackName)
                                .bold()
                            
                            Text(movie.primaryGenreName)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                            
                            Text("Released \(Movie.formattedDate(value: movie.releaseDate))")
                                    .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        Group {
                            if let url = URL(string: movie.previewURL ?? ""),let price = movie.trackPrice {
                              Link(destination: url) {
                                  Text(Movie.formattedPrice(price: price, currency: movie.currency))
                              }.buttonStyle(BuyButtonStyling())
                            }
                        }
                    }
                }
                
                switch viewModel.state {
                case .defaultCase :
                    Color.clear
                        .frame(height: 30)
                        .onAppear {
                        viewModel.loadMore()
                    }
                case .isLoading :
                    ProgressView()
                        .progressViewStyle(.circular)
                case .loadedAll :
                    Color.gray
                        .frame(height: 30)
                case .error(let errorMessage):
                    Text(errorMessage)
                        .foregroundColor(.pink)
                }
                
            }.listStyle(.plain)
                
  
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel.movieMockData())
    }
}
