//
//  SearchViewPlaceHolder.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 25/10/2023.
//

import SwiftUI

struct AlbumSearchViewPlaceHolder: View {
    
    let suggestions = ["30","maher zain","smile"]
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

//struct SearchViewPlaceHolder_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchViewPlaceHolder(searchTerm:)
//    }
//}
