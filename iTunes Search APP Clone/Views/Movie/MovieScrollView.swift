//
//  MovieScrollView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 4/11/2023.
//

import SwiftUI

struct MovieScrollView: View {
    
    let movies:[Movie]
    
    var body: some View {
        ScrollView(.horizontal){
            
            HStack {
                ForEach(movies) { movie in
                    VStack {
                        MovieImageView(urlString: movie.artworkUrl100)
                        Text(movie.trackName)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .lineLimit(1)
                        Text(movie.primaryGenreName).font(.system(size: 15, weight: .semibold, design: .default))
                            .lineLimit(1)
                            .foregroundColor(.gray)
                    }.frame(width: 130)
                        .padding(.horizontal,6)
                }
            }.padding(.vertical)
        }
    }
}

struct MovieScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MovieScrollView(movies: [Movie.example()])
    }
}


struct MovieImageView: View {
    
    let urlString:String
    
    var body: some View {
        AsyncImage(url:URL(string: urlString)) { image in
            image.resizable()
                .frame(width: 100, height: 140)
                .cornerRadius(10)
                .shadow(radius: 8)
        } placeholder: {
            ProgressView()
        }
    }
}
