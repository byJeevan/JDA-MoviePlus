//
//  LoginView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 17/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import SwiftUI

/*
 * Login View for user
 */
struct LoginView: View {
    @State var password: String = ""
    @ObservedObject var loginViewModel: LoginViewModel //injected when LoginView instantiated.
    
    var body: some View {
        VStack {
            LoginTitle()
            UserNameField(userNameString: $loginViewModel.userName)
            PasswordField(passwordString: $loginViewModel.userPass)
            LoginButton(isLoginEnabled: $loginViewModel.isLoginEnable)
        }.padding(Constants.Styles.pagePadding50)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginViewModel: LoginViewModel())
    }
}

//MARK:- UI Elements
struct LoginTitle : View {
    
    var body : some View {
        Text("Hello!! Login to find out latest movie release.")
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.bottom, Constants.Styles.bottomPadding20)
    }
}

struct UserNameField:View {
    var userNameString:Binding<String>
//    @State var username: String = ""
    var body:some View {
        TextField("Username", text: userNameString)
            .padding()
            .background(Constants.Colors.lightGray)
            .cornerRadius(Constants.Styles.smallCornerRadius)
            .padding(.bottom, Constants.Styles.bottomPadding20)
    }
}

struct PasswordField:View {
    var passwordString:Binding<String>
//    @State var password: String = ""
    
    var body:some View {
        SecureField("Password", text: passwordString)
            .padding()
            .background(Constants.Colors.lightGray)
            .cornerRadius(Constants.Styles.smallCornerRadius)
            .padding(.bottom, Constants.Styles.bottomPadding20)
    }
}

struct LoginButton:View{
    var isLoginEnabled:Binding<Bool>
    var body:some View {
        
        Button(action: {
                //your action here
            print("Cliiiked!!!")
            }) {
                 
                      Text("LOGIN")
                          .font(.headline)
                          .foregroundColor(.white)
                          .padding()
                          .frame(width: 220, height: 60)
                        .background(isLoginEnabled.wrappedValue ? Constants.Colors.buttonBlue  : Constants.Colors.darkGray)
                          .cornerRadius(Constants.Styles.largeCornerRadius)
            }
        .disabled(!isLoginEnabled.wrappedValue)
      
        
    }
}



