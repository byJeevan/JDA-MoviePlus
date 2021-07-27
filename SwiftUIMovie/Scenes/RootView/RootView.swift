//
//  RootView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI

struct RootView : View {
  
  @ObservedObject var viewRouter: ViewRouter
  let networkManager = NetworkManager()
  var body: some View {
    VStack {
      if viewRouter.currentPageId == .login {
        LoginView(loginViewModel: LoginViewModel(router: viewRouter))
      } else if viewRouter.currentPageId == .home {
        MovieListView(viewModel:MovieListViewModel(router: viewRouter, networkManager: networkManager), viewRouter: viewRouter)
      }
    }
    
  }
}

struct RootView_Previews : PreviewProvider {
  static var previews: some View {
    RootView(viewRouter: ViewRouter())
  }
}

