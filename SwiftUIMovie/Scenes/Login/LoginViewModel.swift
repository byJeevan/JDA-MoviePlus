//
//  LoginViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginViewState {
  var service: NetworkManager
  var user: UserModel
  var isValidUser: Bool
}

enum LoginViewInput {
  case userNameChange
  case passwordChange
  case buttonTapEvent
}

final class LoginViewModel: ViewModel {
  
  @Published
  var state: LoginViewState
  
  init(service: NetworkManager) {
    self.state = LoginViewState(service: service, user: UserModel(userName: "", password: ""), isValidUser: false)
#if DEBUG
    let user = UserModel(userName: "admin", password: "admin") // To help debug
    self.state = LoginViewState(service: service, user: user, isValidUser: true)
#endif
  }
  
  func validateUser() {
    self.state.isValidUser = (self.state.user.userName.lowercased() == Config.testUserName && self.state.user.password.lowercased() == Config.testPassword)
  }
  
}

extension LoginViewModel {
  func trigger(_ input: LoginViewInput) {
    switch input {
      case .userNameChange:
        self.validateUser()
      case .passwordChange:
        self.validateUser()
      case .buttonTapEvent:
        break
    }
  }
}
