//
//  MovieSearchViewPlaceHolder.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//
//
import SwiftUI

struct MovieSearchViewPlaceHolder: View {
    let suggestions = ["supperman","avengers","iron man"]
    @Binding var searchTerm:String
    
    var body: some View {
        VStack (spacing: 10){
            
            Text("Suggestions")
                .font(.system(size: 30, weight: .semibold, design: .default))
                .foregroundColor(.gray)
            
            ForEach(suggestions,id: \.self) { text in
                Button {
                    searchTerm = text
                } label: {
                    Text(text)
                        .font(.system(size: 22, weight: .medium, design: .default))
                        .foregroundColor(.blue)
                        .underline()
                }
            }
        }
    }
}

//struct MovieSearchViewPlaceHolder_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieSearchViewPlaceHolder()
//    }
//}
