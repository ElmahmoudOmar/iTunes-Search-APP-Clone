//
//  SongScrollView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 4/11/2023.
//

import SwiftUI

struct SongScrollView: View {
    let songs:[Song]
    let rows = Array(repeating: GridItem(.fixed(60), spacing: 10), count: 4)
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(songs) { song in
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
                            }
                        }
                        Spacer()
                        
                        Group {
                          if let url = URL(string: song.previewURL),let price = song.trackPrice {
                              Link(destination: url) {
                                  Text(Song.formattedPrice(price: price, currency: song.currency))
                              }.buttonStyle(BuyButtonStyling())
                            }
                        }
                    }.padding(.horizontal)
                        .frame(width: 350)
                }
            }.padding(.vertical)
        }
    }
}

struct SongScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SongScrollView(songs: [Song.example()])
    }
}
