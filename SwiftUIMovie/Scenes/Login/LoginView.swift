//
//  LoginView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 17/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  
  @ObservedObject
  var loginViewModel: LoginViewModel // injected when LoginView instantiated.
  var loginRouter: LoginRouter

  @State var shouldEnable = true
  @State var isErrorShown = false
  
  var body: some View {
    
    NavigationView {
         VStack {
          LoginImage()
          LoginTitle()
           UserNameField(userNameString: $loginViewModel.state.user.userName,
                         isErrorShown: isErrorShown )
        
          PasswordField(passwordString: $loginViewModel.state.user.password)
          
          Button {
            loginViewModel.validateUser()
            isErrorShown = !loginViewModel.state.isValidUser

          } label: {
            LoginButton(shouldEnable: $shouldEnable)
          }
          .fullScreenCover(isPresented: $loginViewModel.state.isValidUser) {
            // do nothing
          } content: {
            loginRouter.view(for: .movieList, with: loginViewModel.state.service)
          }
        }
        .padding(Constants.Styles.pagePadding50)
   
    }
    
  }
}
