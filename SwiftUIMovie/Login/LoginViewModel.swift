//
//  LoginViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI

class LoginViewModel : ObservableObject {
    let viewRouter:ViewRouter!
    
    init(router:ViewRouter) {
        self.viewRouter = router
    }
    
    @Published var userName = "admin" {
        didSet {
            self.changeLoginButtonState()
        }
    }
    
    @Published var userPass = String() {
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
             viewRouter.currentPageId = .home
        }
        else{
            self.isLoginEnable = false
            self.isLoginAlertShown = true
        }
    }
    
}
