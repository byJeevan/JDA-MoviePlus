//
//  MovieListViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI


struct MovieListState {
  var service: NetworkManager
  var upcoming: [Results] = [Results]()
  var toprated: [Results] = [Results]()
  var searchResult: [Results] = [Results]()
  var selectedMovieId: Int?
  
}

enum MovieListInput {
  case searchedForKey(String)
}

class MovieListViewModel: ViewModel {
  
  @Published
  var state: MovieListState
  
  init(service: NetworkManager) {
    self.state = MovieListState(service: service)
  }
  
  private var pageCounter = 1 //cursor for pagination - user input ?
  
  func loadUpcomingMovies() {
    // Only 1 page loaded.
    state.service.getUpcomingMovies(page: 1) { movies, error in
      DispatchQueue.main.async {
        if error == nil {
          self.state.upcoming = movies?.results ?? [Results]()
        }
      }
    }
  }
  
  func loadTopRatedMovies() {
    
    state.service.getTopRatedMovies(page: pageCounter) { movies, error in
      DispatchQueue.main.async {
        if error == nil {
          self.state.toprated = movies?.results ?? [Results]()
        }
      }
    }
  }
  
  func loadSearchResults(_ key: String) {
    state.service.searchForMovie(key: key, page: 1) { (movies, error) in
      DispatchQueue.main.async {
        if error == nil {
          self.state.searchResult = movies?.results ?? [Results]()
        }
      }
    }
  }

  
}

extension MovieListViewModel {
  
  func trigger(_ input: MovieListInput) {
    switch input {
      case .searchedForKey(let searchKey):
          loadSearchResults(searchKey)
        
    }
  }
}
