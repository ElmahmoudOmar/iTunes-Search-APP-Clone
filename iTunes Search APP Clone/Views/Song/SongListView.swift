//
//  SongListView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 31/10/2023.
//

import SwiftUI

struct SongListView: View {
    
    @ObservedObject var viewModel : SongListViewModel
    
    
    var body: some View {
        
            List{
                ForEach(viewModel.songs) { song in
                    HStack {
                        
                        AsyncImage(url:URL(string: song.artworkUrl60)) { image in
                            image.cornerRadius(5)
                                .shadow(radius: 7)
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading){
                            Text(song.trackName)
                                .bold()
                            HStack {
                                Text(song.artistName)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                Text("-")
                                Text(song.collectionName)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                Spacer()
                            }
                        }
                        Group {
                          if let url = URL(string: song.previewURL),let price = song.trackPrice {
                              Link(destination: url) {
                                  Text(Song.formattedPrice(price: price, currency: song.currency))
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

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel.songMockData())
    }
}
