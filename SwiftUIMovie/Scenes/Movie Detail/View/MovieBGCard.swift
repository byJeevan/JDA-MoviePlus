//
//  MovieBGCard.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 06/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct MovieBGCard: View {
  var moviePosterPath: String
  
  var body: some View {
    if !moviePosterPath.isEmpty {
      let fullPosterURL = URL.init(string: "https://image.tmdb.org/t/p/w500\(moviePosterPath)")
      WebImage(imageURL: fullPosterURL)
    }

  }
}
