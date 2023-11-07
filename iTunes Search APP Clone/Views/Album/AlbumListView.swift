//
//  AlbumListView.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 18/10/2023.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var viewModel : AlbumListViewModel
    
    
    var body: some View {
        
            List{
                ForEach(viewModel.albums) { album in
                    HStack {
                        
                        AsyncImage(url:URL(string: album.artworkUrl60)) { image in
                            image.resizable()
                                .frame(width: 80, height:80)
                                .cornerRadius(5)
                                .shadow(radius: 7)
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading){
                            Text(album.collectionName)
                                .bold()
                            HStack {
                                Text(album.artistName)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                Text("-")
                                Text(album.primaryGenreName)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                            }
                            Text("Released \(Album.formattedDate(value:album.releaseDate))")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        BuyButton(urlString: album.collectionViewURL ?? "", price: album.collectionPrice, currency: album.currency)
                        
                    }
                }
                
                switch viewModel.state {
                case .defaultCase :
                    Color.clear
                        .frame(height: 30)
                        .onAppear {
                        viewModel.loadMore()
                    }
                case .isLoading :
                    ProgressView()
                        .progressViewStyle(.circular)
                case .loadedAll :
                    Color.gray
                        .frame(height: 30)
                case .error(let errorMessage):
                    Text(errorMessage)
                        .foregroundColor(.pink)
                }
                
            }.listStyle(.plain)
    }
}


struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView(viewModel: AlbumListViewModel.albumMockData())
    }
}



struct BuyButton:View {
    
    let urlString : String
    let price : Double?
    let currency : String?
    
    var body: some View {
        
            if let url = URL(string: urlString),let price = price,let currency = currency {
              Link(destination: url) {
                  Text(Album.formattedPrice(price: price, currency: currency))
              }.buttonStyle(BuyButtonStyling())
            }
    }
}
