//
//  LoginButton.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI


struct LoginButton: View {
  
  var shouldEnable: Binding<Bool>
  
  var body:some View {
    
    Text("LOGIN")
      .font(.headline)
      .foregroundColor(.white)
      .padding()
      .frame(width: 220, height: 60)
      .background(shouldEnable.wrappedValue ? Constants.Colors.buttonBlue  : Constants.Colors.darkGray)
      .cornerRadius(30)
    
  }
  
}
