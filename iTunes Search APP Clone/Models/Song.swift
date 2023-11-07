//
//  Song.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 18/10/2023.
//

import Foundation

struct SongResult: Codable {
    let resultCount: Int
    let results: [Song]
}

struct Song: Codable,Identifiable {
    let wrapperType, kind: String
    let artistID, collectionID : Int
    let id: Int
    let artistName, collectionName, trackName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double?
    let releaseDate: String
    let trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country, currency, primaryGenreName: String

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case id = "trackId"
        case artistName, collectionName, trackName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate,trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName
    }
    
    
    static func example()-> Song {
       
        Song(wrapperType: "track", kind: "song", artistID: 262836961, collectionID: 566322358, id: 566322365, artistName: "Adele", collectionName: "Skyfall - Single", trackName: "Skyfall", artistViewURL: "https://music.apple.com/us/artist/adele/262836961?uo=4", collectionViewURL: "https://music.apple.com/us/album/skyfall/566322358?i=566322365&uo=4", trackViewURL: "https://music.apple.com/us/album/skyfall/566322358?i=566322365&uo=4", previewURL: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/a8/f3/65/a8f365f6-9046-8e0a-78ba-5fa964b57ab6/mzaf_8633278038526787975.plus.aac.p.m4a", artworkUrl30: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/b3/fe/cf/b3fecf76-0359-8e14-0651-4b101fc68a3f/886443673632.jpg/30x30bb.jpg", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/b3/fe/cf/b3fecf76-0359-8e14-0651-4b101fc68a3f/886443673632.jpg/60x60bb.jpg", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/b3/fe/cf/b3fecf76-0359-8e14-0651-4b101fc68a3f/886443673632.jpg/100x100bb.jpg", collectionPrice: 1.29, trackPrice: 1.29, releaseDate: "2012-10-05T07:00:00Z", trackCount: 1, trackNumber: 1, trackTimeMillis: 286082, country: "USA", currency: "USD", primaryGenreName: "Pop")
        
    }
    
    static func formattedPrice(price:Double,currency:String)->String {
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        
        let priceString = formatter.string(from: NSNumber(value: price))
        
        return priceString ?? "?"
        
    }
    
}
