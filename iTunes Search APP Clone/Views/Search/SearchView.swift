//
//  SearchView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var selectedType = Entity.all
    
    @StateObject private var albumViewModel = AlbumListViewModel()
    @StateObject private var songViewModel =  SongListViewModel()
    @StateObject private var movieViewModel = MovieListViewModel()

    var body: some View {
    
        NavigationView {
            VStack {
                Picker("Choose media type", selection: $selectedType) {
                    ForEach(Entity.allCases) { type in
                        Text(type.name)
                            .tag(type)
                    }
                }.pickerStyle(.segmented)
                 .padding(.horizontal)
                
                Divider()

                Spacer()
                
                if searchTerm.count == 0 {
                    
                    SearchPlaceHolderView(searchTerm: $searchTerm)
                        .frame(maxHeight: .infinity)
                    
                } else {
                    
                    
                    switch selectedType {
                    case .all:
                        SearchAllListView(albumViewModel: albumViewModel, songViewModel: songViewModel, movieViewModel: movieViewModel)
                    case .album:
                        AlbumListView(viewModel: albumViewModel)
                    case .song:
                        SongListView(viewModel: songViewModel)
                    case .movie:
                        MovieListView(viewModel: movieViewModel)
                    }
                }
            }.navigationTitle("Search")
             .navigationBarTitleDisplayMode(.inline)
             .searchable(text: $searchTerm)
        }.onChange(of: searchTerm) { newValue in
            albumViewModel.searchTerm = newValue
            songViewModel.searchTerm = newValue
            movieViewModel.searchTerm = newValue
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
