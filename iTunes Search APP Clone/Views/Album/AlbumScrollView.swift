//
//  AlbumScrollView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 4/11/2023.
//

import SwiftUI

struct AlbumScrollView: View {
    
    let albums:[Album]
    
    var body: some View {
        ScrollView(.horizontal){
            
            HStack {
                ForEach(albums) { album in
                    VStack {
                        AlbumImageView(urlString: album.artworkUrl100)
                        Text(album.collectionName)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .lineLimit(1)
                        Text(album.artistName).font(.system(size: 15, weight: .semibold, design: .default))
                            .lineLimit(1)
                            .foregroundColor(.gray)
                    }.frame(width: 140)
                        .padding(.horizontal,6)
                }
            }.padding(.vertical)
        }
    }
}

struct AlbumScrollView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScrollView(albums: [Album.example()])
    }
}

struct AlbumImageView: View {
    
    let urlString:String
    
    var body: some View {
        AsyncImage(url:URL(string: urlString)) { image in
            image.resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(10)
                .shadow(radius: 8)
        } placeholder: {
            ProgressView()
        }
    }
}
