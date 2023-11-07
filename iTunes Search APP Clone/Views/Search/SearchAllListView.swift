//
//  SearchAllListView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 31/10/2023.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject  var albumViewModel : AlbumListViewModel
    @ObservedObject  var songViewModel :  SongListViewModel
    @ObservedObject  var movieViewModel : MovieListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                //songs section
                VStack {
                    HStack {
                        
                        Text("Songs").font(.system(size: 25, weight: .medium, design: .default))
                        
                        Spacer()
                        
                        NavigationLink {
                            SongListView(viewModel: songViewModel)
                        } label: {
                            HStack {
                                Text("See all")
                                Image(systemName: "chevron.right")
                            }
                        }
                    }.padding()
                    
                    // songs view
                    
                    SongScrollView(songs: songViewModel.songs)
                    
                }.background {
                    LinearGradient(colors: [Color(uiColor: .white),Color(uiColor: .lightGray).opacity(0.3)], startPoint: .top, endPoint: .bottom)
                }
                
                //albums section
                VStack {
                    HStack {
                        
                        Text("Albums").font(.system(size: 25, weight: .medium, design: .default))
                        
                        Spacer()
                        
                        NavigationLink {
                            AlbumListView(viewModel: albumViewModel)
                        } label: {
                            HStack {
                                Text("See all")
                                Image(systemName: "chevron.right")
                            }
                        }
                    }.padding()
            
                    // albums view
                    
                    AlbumScrollView(albums: albumViewModel.albums)
                    
                }.background {
                    LinearGradient(colors: [Color(uiColor: .white),Color(uiColor: .lightGray).opacity(0.3)], startPoint: .top, endPoint: .bottom)
                }
                
            
                
                //movies section
                
                VStack {
                    HStack {
                        
                        Text("Movies").font(.system(size: 25, weight: .medium, design: .default))
                        
                        Spacer()
                        
                        NavigationLink {
                            MovieListView(viewModel: movieViewModel)
                        } label: {
                            HStack {
                                Text("See all")
                                Image(systemName: "chevron.right")
                            }
                        }
                    }.padding()
                    
                    // movies view
                    
                    MovieScrollView(movies: movieViewModel.movies)
                    
                }.background {
                    LinearGradient(colors: [Color(uiColor: .white),Color(uiColor: .lightGray).opacity(0.3)], startPoint: .top, endPoint: .bottom)
                }
            }
        }
    }
}

struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumViewModel: AlbumListViewModel.albumMockData(), songViewModel: SongListViewModel.songMockData(), movieViewModel: MovieListViewModel.movieMockData())
    }
}
