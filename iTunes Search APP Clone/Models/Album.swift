//
//  Album.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 18/10/2023.
//

import Foundation

struct AlbumResult: Codable {
    let resultCount: Int
    let results: [Album]
}

struct Album: Codable,Identifiable {
    let wrapperType, collectionType: String
    let artistID ,amgArtistID: Int?
    let id : Int
    let artistName, collectionName: String
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double?
    let collectionExplicitness: String
    let trackCount: Int
    let copyright, country, currency: String
    let releaseDate: String
    let primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case id = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName
    }
    
    
   static func example()-> Album {
        
        Album(wrapperType: "collection", collectionType: "Album", artistID: 262836961, amgArtistID: 861756, id: 1590035691, artistName: "Adele", collectionName: "30", artistViewURL: "https://music.apple.com/us/artist/adele/262836961?uo=4", collectionViewURL: "https://music.apple.com/us/album/30/1590035691?uo=4", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/73/6d/7c/736d7cfb-c79d-c9a9-4170-5e71d008dea1/886449666430.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/73/6d/7c/736d7cfb-c79d-c9a9-4170-5e71d008dea1/886449666430.jpg/100x100bb.jpg", collectionPrice: 10.99, collectionExplicitness: "", trackCount: 12, copyright: "℗ 2021 Melted Stone under exclusive license to Columbia Records, a Division of Sony Music Entertainment", country: "USA", currency: "USD", releaseDate: "2021-11-19T08:00:00Z", primaryGenreName: "Pop")
    
    }
    
    static func formattedDate(value:String) -> String {
         let dateFormatterGetter = DateFormatter()
         dateFormatterGetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
         
         guard let date = dateFormatterGetter.date(from: value) else {
             return ""
         }
         let dateFormatter = DateFormatter()
         dateFormatter.locale = Locale.current
         dateFormatter.dateStyle = .medium
         dateFormatter.timeStyle = .none
         let dateString = dateFormatter.string(from: date)
         
         return dateString
     }
    
    static func formattedPrice(price:Double,currency:String)->String {
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        
        let priceString = formatter.string(from: NSNumber(value: price))
        
        return priceString ?? "?"
        
    }
    
    
}
