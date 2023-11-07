//
//  MovieSearchView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var viewModel = MovieListViewModel()


    var body: some View {
        NavigationView {

            Group {
                if viewModel.searchTerm.isEmpty {

                    MovieSearchViewPlaceHolder(searchTerm: $viewModel.searchTerm)

                } else {

                    MovieListView(viewModel: viewModel)

                }
            }.searchable(text: $viewModel.searchTerm)
             .navigationTitle("Search")
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView(viewModel: MovieListViewModel.movieMockData())
    }
}
