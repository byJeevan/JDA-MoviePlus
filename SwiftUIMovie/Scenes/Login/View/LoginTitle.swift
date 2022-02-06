//
//  LoginTitle.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct LoginTitle: View {
  
  var body : some View {
    Text("Hello!! Login to find out latest movie release.")
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .padding(.bottom, Constants.Styles.bottomPadding20)
  }
}
