//
//  MovieListViewModel.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//

import Foundation
import Combine

class MovieListViewModel:ObservableObject {
    
    @Published var searchTerm:String = ""
    @Published var movies:[Movie] = [Movie]()
    @Published var state:FetchState = .defaultCase {
        didSet {
            print(" state changed to :\(state)")
        }
    }
    
    let service = APIservice()
    
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
            self?.state = .defaultCase
            self?.movies = []
            self?.fetchMovies(for: term)
        }.store(in: &subscriptions)

    }
    
    func loadMore(){
        fetchMovies(for: searchTerm)
    }
    
    
    func fetchMovies(for searchTerm:String){
        
        guard state == FetchState.defaultCase else {return}
        
        guard !searchTerm.isEmpty else {return}
     
        service.fetchMovies(searchTerm: searchTerm){[weak self] result in
           
            DispatchQueue.main.async {
                self?.state = .isLoading
            }
            switch result {
            case .success(let successCase):
                DispatchQueue.main.async {
                    for movie in successCase.results {
                        self?.movies.append(movie)
                    }
                    self?.state = .defaultCase
                }
            case .failure(let failureCase):
                DispatchQueue.main.async {
                    self?.state = .error(failureCase.localizedDescription)
                }
            }
        }
    }

    
    static func movieMockData()-> MovieListViewModel {
        
        let vm = MovieListViewModel()
            vm.movies = [Movie.example()]
        return vm
    }
    
    
    
}
