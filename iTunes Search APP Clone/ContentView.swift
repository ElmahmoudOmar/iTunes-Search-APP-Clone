//
//  ContentView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 18/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            SearchView().tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            
            
            AlbumSearchView()
                .tabItem {
                    Label("Albums", systemImage: "music.note.list")
                }
            
            MovieSearchView()
                .tabItem {
                    Label("Movies", systemImage: "tv")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
