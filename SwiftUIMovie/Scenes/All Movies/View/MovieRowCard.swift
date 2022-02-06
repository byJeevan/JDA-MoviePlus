//
//  MovieRowCard.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 05/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//

import SwiftUI


struct MovieRowCard: View {
  var movie: Results
  
  var body: some View {
    let fullPosterURL = URL.init(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")!
    
    HStack(alignment: .top, spacing: 16) {
      WebImage(imageURL:fullPosterURL)
        .frame(width: 90, height: 120).cornerRadius(4)
        .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 4, content: {
        
        Text(movie.title ?? "").lineLimit(5).foregroundColor(.white)
        Text(movie.release_date ?? "").foregroundColor(Color.white.opacity(0.75))
        
        HStack {
          Image(systemName: "star.fill")
            .foregroundColor(.yellow)
          Text(String(format: "%.1f", Float(movie.vote_average ?? 0.0))).foregroundColor(Color.white.opacity(0.75))
        }
        
      })
      Spacer()
    }
    .padding(8)
    
  }
}
