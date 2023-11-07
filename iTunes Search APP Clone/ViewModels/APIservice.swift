//
//  APIservice.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 29/10/2023.
//

import Foundation


class APIservice {
    
    func fetchAlbums(searchTerm:String,page:Int,limit:Int,completion:@escaping (Result<AlbumResult,APIError>)->Void){
        let url = creatURL(for: searchTerm,entity: Entity.album,page: page,limit: limit)
        fetch(type: AlbumResult.self, url: url, completion: completion)
    }
    
    func fetchSongs(searchTerm:String,page:Int,limit:Int,completion:@escaping (Result<SongResult,APIError>)->Void){
        let url = creatURL(for: searchTerm, entity: Entity.song,page: page,limit: limit)
        fetch(type: SongResult.self, url: url, completion: completion)
    }
    
    func fetchMovies(searchTerm:String,completion:@escaping (Result<MovieResult,APIError>)->Void){
        let url = creatURL(for: searchTerm, entity: Entity.movie,page: nil,limit: nil)
        fetch(type: MovieResult.self, url: url, completion: completion)
    }
    
    func creatURL(for searchTerm: String, entity:Entity,page:Int?,limit:Int?) -> URL? {
        
        let baseURL = "https://itunes.apple.com/search"
     
        var componnent = URLComponents(string: baseURL)
        
        var quieryItems = [URLQueryItem(name: "term", value: searchTerm),
                           URLQueryItem(name: "entity", value: entity.rawValue)]
        
        if let page = page,let limit = limit {
            let offset = page * limit
            
            quieryItems.append(contentsOf: [URLQueryItem(name: "limit", value: String(limit)),
                                            URLQueryItem(name: "offset", value: String(offset))])
        }
        
        componnent?.queryItems = quieryItems
        
        return componnent?.url
    }
    
    
    func fetch<T:Codable>(type:T.Type,url:URL?,completion:@escaping (Result<T,APIError>)->Void){
        
        guard let url = url
        else {
            completion(.failure(APIError.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                
                completion(.failure(APIError.urlSession(error)))
                print(error)
                
            }else if let response = response as? HTTPURLResponse, !(200...300).contains(response.statusCode){
                
                completion(.failure(APIError.badResponse(statusCode: response.statusCode)))
                print(error as Any)
                
            }else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(.success(result))
                    
                } catch {
                    completion(.failure(APIError.parsing(error as? DecodingError)))
                    print(error)
                }
            }
        }.resume()
    }
    
    
}
