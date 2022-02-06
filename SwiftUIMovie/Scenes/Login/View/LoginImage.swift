//
//  LoginImage.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct LoginImage : View {
  
  var body:some View {
    Image("pop-corn")
      .resizable()
      .frame(width: 128, height: 128)
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.white, lineWidth: 4))
    
      .shadow(color: Color.gray.opacity(0.25), radius: 10)
      .padding(.bottom, Constants.Styles.bottomPadding20)
  }
}
