//
//  Movie.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 18/10/2023.
//

import Foundation


struct MovieResult: Codable {
    let resultCount: Int
    let results: [Movie]
}

struct Movie: Codable,Identifiable{
    let wrapperType, kind: String
//    let artistID: Int?
    let id: Int
    let artistName, trackName, trackCensoredName: String
//    let artistViewURL: String?
    let trackViewURL: String
    let previewURL: String?
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice : Double?
    let trackPrice: Double?
    let trackRentalPrice, collectionHDPrice, trackHDPrice, trackHDRentalPrice: Double?
    let releaseDate: String
    let collectionExplicitness, trackExplicitness: String
    let trackTimeMillis: Int?
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let shortDescription : String?
    let longDescription: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case id = "trackId"
        case artistName, trackName, trackCensoredName
//        case artistViewURL = "artistViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription
    }
    
    static func example()-> Movie {
    
        Movie(wrapperType: "track", kind: "feature-movie", id: 688163154, artistName: "Jon Favreau", trackName: "Iron Man", trackCensoredName: "Iron Man", trackViewURL: "https://itunes.apple.com/us/movie/iron-man/id688163154?uo=4", previewURL: "https://video-ssl.itunes.apple.com/itunes-assets/Video127/v4/67/dd/a4/67dda4b6-16a1-1568-f57a-e1717031ee93/mzvf_2347745602296364888.640x362.h264lc.U.p.m4v", artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Video128/v4/89/74/cf/8974cfa0-5e27-1c5e-390a-e97e5d12a51d/contsched.rdzrzprk.lsr/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Video128/v4/89/74/cf/8974cfa0-5e27-1c5e-390a-e97e5d12a51d/contsched.rdzrzprk.lsr/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video128/v4/89/74/cf/8974cfa0-5e27-1c5e-390a-e97e5d12a51d/contsched.rdzrzprk.lsr/100x100bb.jpg", collectionPrice: 9.99, trackPrice: 9.99, trackRentalPrice: 3.99, collectionHDPrice: 9.99, trackHDPrice: 9.99, trackHDRentalPrice: 3.99, releaseDate: "2008-05-02T07:00:00Z", collectionExplicitness: "", trackExplicitness: "", trackTimeMillis: 7589915, country: "USA", currency: "USD", primaryGenreName: "Action & Adventure", contentAdvisoryRating: "PG-13", shortDescription: "After surviving an unexpected attack in enemy territory, jet-setting industrialist Tony Stark builds", longDescription: "After surviving an unexpected attack in enemy territory, jet-setting industrialist Tony Stark builds a high-tech suit of armor and vows to protect the world as Iron Man. Straight from the pages of the legendary comic book, Iron Man is a hero who is built - not born - to be unlike any other.")
        
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
