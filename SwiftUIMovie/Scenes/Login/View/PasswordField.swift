//
//  PasswordField.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI


struct PasswordField: View {
  var passwordString: Binding<String>
  
  var body:some View {
    SecureField("Password", text: passwordString)
      .padding()
      .background(Constants.Colors.lightGray)
      .cornerRadius(Constants.Styles.smallCornerRadius)
      .padding(.bottom, Constants.Styles.bottomPadding20)
  }
}
