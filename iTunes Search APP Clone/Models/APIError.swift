//
//  APIError.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 29/10/2023.
//

import Foundation
 
enum APIError : Error, CustomStringConvertible {
 
    case badURL
    case badResponse(statusCode:Int)
    case urlSession(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // user feedback
        switch self {
        case .badURL,.unknown,.parsing:
            return "Sorry, somthing went wrong."
        case .badResponse(_):
            return "Sorry, the connection to  our server failed."
        case .urlSession(let error):
            return error?.localizedDescription ?? "Sorry, somthing went wrong."
        }
        
    }
    var description: String {
        // info for debugging
        
        switch self {
        case .badURL:
            return "invalid URL"
        case .badResponse(let statusCode):
            return "bad response with status code \(statusCode)"
        case .urlSession(let Error):
            return Error?.localizedDescription ?? "urlSession error"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "decoding problem")"
        case .unknown:
            return "unknown"
        }
    }
    
    
}
