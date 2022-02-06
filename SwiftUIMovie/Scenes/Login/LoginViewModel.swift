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
    let user = UserModel(userName: "admin1", password: "admin")
    self.state = LoginViewState(service: service, user: user, isValidUser: false)
  }
   
  /*
   @Published var userName = "" {
   didSet {
   self.changeLoginButtonState()
   }
   }
   
   @Published var userPass = "" {
   didSet{
   self.changeLoginButtonState()
   }
   }
   
   @Published var isLoginEnable = false
   @Published var isLoginAlertShown = false
   
   private func changeLoginButtonState(){
   if (userName.count > 0 && userPass.count > 0) {
   self.isLoginEnable = true
   }
   else{
   self.isLoginEnable = false
   }
   }
   
   func validateLoginButton() {
   if (userName.lowercased() == Config.testUserName && userPass.lowercased() == Config.testPassword) {
   //      viewRouter.currentPageId = .home
   viewRouter.view(for: .movieList, with: nil)
   }
   else{
   self.isLoginEnable = false
   self.isLoginAlertShown = true
   }
   }
   */
  
}

extension LoginViewModel {
  func trigger(_ input: LoginViewInput) {
    switch input {
      case .userNameChange:
        self.state.isValidUser = true
        break
      case .passwordChange:
        break
      case .buttonTapEvent:
        break
    }
  }
}
