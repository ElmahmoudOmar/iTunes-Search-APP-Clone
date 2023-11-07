//
//  SongListViewModel.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//

import Foundation
import Combine

class SongListViewModel:ObservableObject {
    
    @Published var searchTerm:String = ""
    @Published var songs:[Song] = [Song]()
    @Published var state:FetchState = .defaultCase {
        didSet {
            print(" state changed to :\(state)")
        }
    }
    
    let limit:Int = 20
    var page:Int = 0
    
    let service = APIservice()
    
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
            self?.state = .defaultCase
            self?.page = 0
            self?.songs = []
            self?.fetchSongs(for: term)
        }.store(in: &subscriptions)

    }
    
    func loadMore(){
        fetchSongs(for: searchTerm)
    }
    
    
    func fetchSongs(for searchTerm:String){
        
        guard state == FetchState.defaultCase else {return}
        
        guard !searchTerm.isEmpty else {return}
     
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit){[weak self] result in
           
            DispatchQueue.main.async {
                self?.state = .isLoading
            }
            switch result {
            case .success(let successCase):
                DispatchQueue.main.async {
                    for song in successCase.results {
                        self?.songs.append(song)
                    }
                    self?.page += 1
                    self?.state = (successCase.results.count == self?.limit) ? .defaultCase : .loadedAll
                }
            case .failure(let failureCase):
                DispatchQueue.main.async {
                    self?.state = .error(failureCase.localizedDescription)
                }
            }
        }
    }

    
    static func songMockData()-> SongListViewModel {
        
        let vm = SongListViewModel()
        vm.songs = [Song.example()]
        return vm
    }
    
    
    
}
