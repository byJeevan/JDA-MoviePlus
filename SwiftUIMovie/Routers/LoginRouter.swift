//
//  LoginRouter.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 04/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI

enum LoginRoute {
  case login
  case movieList
}

struct LoginRouter: Routing {
  
  func view(for route: LoginRoute, with service: NetworkManager) -> some View {
    switch route {
      case .login:
        LoginView(loginViewModel: LoginViewModel(service: service), loginRouter: LoginRouter())
      case .movieList:
        MovieListView(viewModel: MovieListViewModel.init(service: service), movieRouter: MovieRouter() )
    }
  }
  
}
