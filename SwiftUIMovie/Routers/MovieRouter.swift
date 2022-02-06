//
//  MovieRouter.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 04/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI

enum MovieRoute {
  case openDetail(Int)
}

struct MovieRouter: Routing {
  
  func view(for route: MovieRoute, with service: NetworkManager) -> some View {
    switch route {
      case .openDetail(let selectedMovieId):
        let vm = MoviewDetailViewModel(service: service, selectedMovieId: selectedMovieId)
        return MovieDetailView(viewModel: vm)
    }
  }
  
}
