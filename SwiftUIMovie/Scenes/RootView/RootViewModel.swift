//
//  RouteViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI

struct RootState {
  var isLoggedIn: Bool
  var service: NetworkManager
}

enum RootInput {
  // No user inputs
}

final class RootViewModel: ViewModel {
  
  @Published
  var state: RootState
  
  init(service: NetworkManager) {
    self.state = RootState(isLoggedIn: UserDefaults.standard.isLoggedIn, service: service)
  }
  
}

extension RootViewModel {
  
  func trigger(_ input: RootInput) {
     // no implementation
  }
}
