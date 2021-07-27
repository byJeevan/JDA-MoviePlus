//
//  MoviewDetailViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan on 16/05/21.
//  Copyright © 2021 Jeevan-1382. All rights reserved.
//

import Foundation
import Combine


class MoviewDetailViewModel:ObservableObject, Identifiable {

  var networkManager: NetworkManager!
  var selectedMovieId:Int!
  let willChange = PassthroughSubject<Void, Never>()
  @Published var isMovieDetailVisible: Bool = false
  var genras:String?
  var duration:String?

  var movieDetail:MovieDetailModel? {
    didSet{
      var result:String = ""
      movieDetail?.genres?.forEach({ (genre) in
        result.append("\(genre.name ?? ""), ")
      })
      genras = String(result.dropLast(2))

      if let runtime = movieDetail?.runtime  {
        duration = "\(runtime / 60) Hours \(runtime % 60) Minuts "
      }

    }
  }

  init(selectedMovieId:Int, networkManager:NetworkManager) {
    self.selectedMovieId = selectedMovieId
    self.networkManager = networkManager
  }

  func loadMovieDetails(){

    self.networkManager.getMovieDetail(movieId: selectedMovieId) { (movieDetail, error) in
      DispatchQueue.main.async {
        if error == nil {
          self.movieDetail = movieDetail
          self.isMovieDetailVisible = true
        }
      }

    }
  }
}
