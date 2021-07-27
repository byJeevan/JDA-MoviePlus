//
//  ViewRouter.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

enum PageId: Equatable {
  case login
  case home
  case movieDetail(movieId:Int)
}

class ViewRouter: ObservableObject {

  let objectWillChange = PassthroughSubject<ViewRouter,Never>() // passes its data to any view that’s observing. i.e. RootView in our case.i
  var currentPageId:PageId = UserDefaults.standard.isLoggedIn ? .home : .login {
    didSet {
      objectWillChange.send(self)
    }
  }

}
