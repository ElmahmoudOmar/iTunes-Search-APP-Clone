//
//  SearchPlaceHolderView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 31/10/2023.
//

import SwiftUI

struct SearchPlaceHolderView: View {
    
    @Binding var searchTerm:String
    
    var body: some View {
        
        VStack {
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 170, height: 170)
                .foregroundColor(.gray).opacity(0.5)
                .padding(.bottom)
            
            Text("There is nothing to show")
                .font(.system(size: 25, weight: .semibold, design:
                .rounded)).foregroundColor(.gray)
                .opacity(0.5)
        }
        
        }
}

//struct SearchPlaceHolderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchPlaceHolderView()
//    }
//}
