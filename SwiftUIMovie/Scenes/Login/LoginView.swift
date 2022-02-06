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
  var loginViewModel: LoginViewModel //injected when LoginView instantiated.
  var loginRouter: LoginRouter
  
  @State var shouldEnable = true
  @State var canOpenHome = false
  
  var body: some View {
    NavigationView {
         VStack {
          LoginImage()
          LoginTitle()
          UserNameField(userNameString: $loginViewModel.state.user.userName)
          PasswordField(passwordString: $loginViewModel.state.user.password)
          
          Button {
            $canOpenHome.wrappedValue.toggle()
          } label: {
            LoginButton(shouldEnable: $shouldEnable)
          }
          .fullScreenCover(isPresented: $canOpenHome) {
            // do nothing
          } content: {
            loginRouter.view(for: .movieList, with: loginViewModel.state.service)
          }

//          .fullScreenCover(item: $canOpenHome, onDismiss: nil, content: {
//            loginRouter.view(for: .movieList, with: loginViewModel.state.service)
//          })
           
          //          .alert(isPresented: $loginViewModel.isLoginAlertShown) {
          //            Alert(title: Text("Invalid Credentails !!"), message: Text("Please login with valid username or password"), dismissButton: .default(Text("OK")))
          //          }
          //          .disabled(!loginViewModel.isLoginEnable)
          //
          //        UserNameField(userNameString: $loginViewModel.userName)
          //        PasswordField(passwordString: $loginViewModel.userPass)
          //        LoginButton(loginViewModel: loginViewModel)
          //
          //
        }
        .padding(Constants.Styles.pagePadding50)
   
    }
    
  }
}

//struct LoginView_Previews: PreviewProvider {
//  static var previews: some View {
//    LoginView(loginViewModel: LoginViewModel(router: LoginRouter()))
//  }
//}



 



/*
 struct LoginButton: View {
 
 @ObservedObject var loginViewModel: LoginViewModel
 
 var body:some View {
 
 Button(action: {
 self.loginViewModel.validateLoginButton()
 }) {
 Text("LOGIN")
 .font(.headline)
 .foregroundColor(.white)
 .padding()
 .frame(width: 220, height: 60)
 .background(loginViewModel.isLoginEnable ? Constants.Colors.buttonBlue  : Constants.Colors.darkGray)
 .cornerRadius(30)
 }
 .alert(isPresented: $loginViewModel.isLoginAlertShown) {
 Alert(title: Text("Invalid Credentails !!"), message: Text("Please login with valid username or password"), dismissButton: .default(Text("OK")))
 }
 .disabled(!loginViewModel.isLoginEnable)
 
 }
 
 }
 */
