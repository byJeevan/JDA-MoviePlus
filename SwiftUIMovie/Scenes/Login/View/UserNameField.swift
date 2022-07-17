//
//  UserNameField.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct UserNameField: View {
  var userNameString: Binding<String>
  var isErrorShown: Bool
  var body: some View {
    TextField("Username", text: userNameString)
      .padding()
      .background(isErrorShown ? Color.red : Constants.Colors.lightGray)
      .cornerRadius(Constants.Styles.smallCornerRadius)
      .padding(.bottom, Constants.Styles.bottomPadding20)
    
  }
}
