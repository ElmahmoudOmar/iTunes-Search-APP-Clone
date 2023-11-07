//
//  FetchState.swift
//  iTunes Search APP Clone
//
//  Created by macbook pro on 30/10/2023.
//

import Foundation

enum FetchState : Comparable {
    
case defaultCase
case isLoading
case error(String)
case loadedAll
    
}
