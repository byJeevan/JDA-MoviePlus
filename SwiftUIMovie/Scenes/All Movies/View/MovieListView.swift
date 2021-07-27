//
//  MovieListView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import SwiftUI

struct MovieListView: View {

  @ObservedObject var viewModel: MovieListViewModel
  @ObservedObject var viewRouter: ViewRouter

  @State private var isPresented = false
  @State var selectedMovieId:Int?


  var body: some View {
    NavigationView {

      ZStack {

        Color.black.opacity(0.85).edgesIgnoringSafeArea(.all)

        NavigationLink(destination: MovieDetailView(viewModel: MoviewDetailViewModel(selectedMovieId: selectedMovieId ?? 0, networkManager: $viewModel.networkManager.wrappedValue)), isActive: $isPresented) { }

        VStack(spacing: 20) {
          SearchBar(viewModel: viewModel).padding(.horizontal, 32)

          ScrollView {
            VStack(alignment: .leading) {

              if $viewModel.isUpcomingVisible.wrappedValue {
                Text("UPCOMINNG").foregroundColor(.white).bold().padding()

                // Section 1
                ScrollView(.horizontal) {
                  HStack(spacing: 16) {
                    ForEach($viewModel.upcoming.wrappedValue, id: \.self) { upcoming in
                      Button(action: {
                        isPresented = true
                        selectedMovieId = upcoming.id
                      }) {
                        MovieSmallCard(movie: upcoming)
                      }.padding(.bottom, 16.0)
                    }
                  }

                }.padding(.horizontal)
                .padding(.bottom)
              }


              if $viewModel.isTopRatedVisible.wrappedValue {
                Text("TRENDING").foregroundColor(.white).bold().padding()

                // Section 2
                ScrollView(.vertical) {

                  VStack(spacing: 8) {

                    ForEach($viewModel.toprated.wrappedValue, id: \.self) { toprated in
                      Button(action: {
                        isPresented = true
                        selectedMovieId = toprated.id

                      }) {
                        MovieRowCard(movie: toprated)

                      }.padding(.bottom, 16.0)

                    }

                  }

                }.padding(.horizontal)
              }

              if $viewModel.isSearchResultFound.wrappedValue {
                Text(($viewModel.searchResult.wrappedValue.count > 1 ? "" : "😐 NO") + "Search Result".uppercased()).foregroundColor(.white).bold().padding()

                // If section 1&2 hidden
                ScrollView(.vertical) {

                  VStack(spacing: 8) {

                    ForEach($viewModel.searchResult.wrappedValue, id: \.self) { searchItem in
                      Button(action: {
                        isPresented = true
                        selectedMovieId = searchItem.id
                      }) {
                        MovieRowCard(movie: searchItem)
                      }.padding(.bottom, 16.0)

                    }

                  }

                }.padding(.horizontal)
              }

            }

          }
        }

      }
      .navigationBarHidden(true)

    }
    .onAppear(perform: fetch)

  }

  private func fetch(){
    viewModel.loadUpcomingMovies()
    viewModel.loadTopRatedMovies()
  }

}

struct MovieSmallCard: View {
  var movie:Results

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

struct MovieRowCard: View {
  var movie:Results

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

struct MovieListView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView(viewModel: MovieListViewModel(router: ViewRouter(), networkManager: NetworkManager()), viewRouter: ViewRouter())
  }
}
