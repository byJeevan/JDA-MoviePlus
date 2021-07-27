//
//  MovieListViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


// https://api.themoviedb.org/3/search/movie?api_key=d156ee8a7d88cc93de2b0c5fb01ba511&language=en-US&query=movie&page=1&include_adult=false&region=india

/*
 * View Model class for Movie List (Home page)
 */
class MovieListViewModel: NSObject, ObservableObject, Identifiable {
  var networkManager: NetworkManager!
  let viewRouter:ViewRouter!

  @Published var searchKey = "" {
    willSet {
      NSObject.cancelPreviousPerformRequests(withTarget: self)
      self.perform(#selector(performSearch), with: searchKey, afterDelay: 2.0)
    }
  }

  private var pageCounter = 1 //cursor for pagination
  let willChange = PassthroughSubject<Void, Never>()

  @Published var isUpcomingVisible: Bool = false
  @Published var isTopRatedVisible: Bool = false
  @Published var isSearchResultFound: Bool = false

  var upcoming: [Results] = [Results]() {
    willSet {
      willChange.send()
    }
  }

  var toprated: [Results] = [Results]() {
    willSet {
      willChange.send()
    }
  }

  var searchResult: [Results] = [Results]() {
    willSet {
      willChange.send()
    }
  }

  init(router:ViewRouter, networkManager:NetworkManager) {
    self.viewRouter = router
    self.networkManager = networkManager
  }

  func loadUpcomingMovies() {
    //Only 1 page loaded.
    self.networkManager.getUpcomingMovies(page: 1) { movies, error in
      DispatchQueue.main.async {
        if error == nil {
          self.upcoming = movies?.results ?? [Results]()
          self.isUpcomingVisible = true
        }
      }
    }
  }

  func loadTopRatedMovies() {

    self.networkManager.getTopRatedMovies(page: pageCounter) { movies, error in
      DispatchQueue.main.async {
        if error == nil {
          self.toprated = movies?.results ?? [Results]()
          self.isTopRatedVisible = true
        }
      }
    }
  }

  func loadSearchResults(_ key:String) {
    self.networkManager.searchForMovie(key: key, page: 1) { (movies, error) in
      DispatchQueue.main.async {
        if error == nil {
          self.searchResult = movies?.results ?? [Results]()
          self.isSearchResultFound = true
          self.isUpcomingVisible = false
          self.isTopRatedVisible = false
        }
      }
    }
  }

   @objc func performSearch() {
    if !searchKey.isEmpty {
      loadSearchResults(searchKey)
    }
    else{
      clearSearch()
    }
  }

  func clearSearch() {
    self.searchResult = []
    self.isUpcomingVisible = true
    self.isTopRatedVisible = true
    self.isSearchResultFound = false
  }
}


