//
//  SearchView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 25/10/2023.
//

import SwiftUI

struct AlbumSearchView: View {
    
    @StateObject var viewModel = AlbumListViewModel()

    
    var body: some View {
        NavigationView {
            
            Group {
                if viewModel.searchTerm.isEmpty {
                    
                    AlbumSearchViewPlaceHolder(searchTerm: $viewModel.searchTerm)
                    
                } else {
                    
                    AlbumListView(viewModel: viewModel)
                    
                }
            }.searchable(text: $viewModel.searchTerm)
             .navigationTitle("Search")
        }
    }
}

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
