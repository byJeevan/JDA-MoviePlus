//
//  RootView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct RootView : View {
  
  @ObservedObject
  var viewModel: RootViewModel
  var loginRouter: LoginRouter
  
  var body: some View {
    VStack {
      loginRouter.view(for: viewModel.state.isLoggedIn ? .movieList : .login, with: viewModel.state.service)
    }
  }
}

//struct RootView_Previews : PreviewProvider {
//  static var previews: some View {
//    RootView(viewRouter: LoginRouter())
//  }
//}
//
