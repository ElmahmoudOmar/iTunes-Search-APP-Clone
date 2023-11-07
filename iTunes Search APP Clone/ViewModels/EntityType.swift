//
//  EntityType.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//

import Foundation


enum Entity : String,Identifiable,CaseIterable{
case all
case album
case song
case movie
    
    var id: String {
        self.rawValue
    }
    
    var name:String {
        switch self {
        case .all:
            return "All"
        case .album:
            return "Album"
        case .song:
            return "Song"
        case .movie:
            return "Movie"
        }
    }
    
}
