//
//  MoviewDetailViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan on 16/05/21.
//  Copyright © 2021 Jeevan-1382. All rights reserved.
//

import SwiftUI


struct MoviewDetailState {
  var service: NetworkManager
  var movieDetail: MovieDetailModel?
}

enum MoviewDetailInput {
  // TODO : favourite
}

final class MoviewDetailViewModel: ViewModel {
  
  @Published var state: MoviewDetailState
  var selectedMovieId: Int
  
  init(service: NetworkManager, selectedMovieId: Int) {
    self.state = MoviewDetailState(service: service)
    self.selectedMovieId = selectedMovieId
  }
  
  func loadMovieDetails() {
    self.state.service.getMovieDetail(movieId: selectedMovieId) { (movieDetail, error) in
      DispatchQueue.main.async {
        if error == nil {
          self.state.movieDetail = movieDetail
        }
      }
    }
  }
  
  
  var posterPath: String  {
    self.state.movieDetail?.poster_path ?? ""
  }
  
  var movieTitle: String {
    self.state.movieDetail?.title ?? ""
  }
  
  var averageVote: Double {
    self.state.movieDetail?.vote_average ?? 0.0
  }
  
  var overview: String {
    self.state.movieDetail?.overview ?? ""
  }
  
  var genre: String {
    var result = ""
    self.state.movieDetail?.genres?.forEach({ (genre) in
      result.append("\(genre.name ?? ""), ")
    })
    return String(result.dropLast(2))
  }
  
  var duration: String {
    var result = "Run Time : N/a"
    if let runtime = self.state.movieDetail?.runtime  {
      result = "Run Time : \(runtime / 60) Hours \(runtime % 60) Minuts "
    }
    return result
  }

  
}

extension MoviewDetailViewModel {
  
  func trigger(_ input: MoviewDetailState) {
     
  }
}
