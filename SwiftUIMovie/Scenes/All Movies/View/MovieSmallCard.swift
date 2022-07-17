//
//  MovieSmallCard.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct MovieSmallCard: View {
  var movie: Results
  
  var body: some View {
    let fullPosterURL = URL.init(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")!
    
    return VStack {
      WebImage(imageURL:fullPosterURL).scaledToFit().cornerRadius(8)
      
      VStack(spacing : 4) {
        Text(movie.title ?? "").lineLimit(5).foregroundColor(.white)
        Text(movie.release_date ?? "").foregroundColor(Color.white.opacity(0.75))
      }
    }
    .frame(width:200, height:300) //2:3 ratio of poster
    
  }
}
