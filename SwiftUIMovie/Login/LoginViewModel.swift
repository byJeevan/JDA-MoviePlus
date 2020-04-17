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
    @Published var userName = "admin" {
        didSet {
            self.validateFields()
        }
    }
    
    @Published var userPass = String() {
        didSet{
            self.validateFields()
        }
    }
    
    @Published var isLoginEnable = false
    
    private func validateFields(){
        
        if (userName.lowercased() == Config.testUserName && userPass.lowercased() == Config.testPassword) {
            isLoginEnable = true
        }
        else{
            isLoginEnable = false
        }
    }
    
}
