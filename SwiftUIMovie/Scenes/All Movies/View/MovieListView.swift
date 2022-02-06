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
  var movieRouter: MovieRouter
  
  fileprivate func upcomingListView() -> some View {
    
    return ScrollView(.horizontal) {
      HStack(spacing: 16) {
        ForEach($viewModel.state.upcoming.wrappedValue, id: \.self) { upcoming in
          NavigationLink(destination: movieRouter.view(for: .openDetail(upcoming.id ?? -1), with: viewModel.state.service)) {
            MovieSmallCard(movie: upcoming)
              .padding(.bottom, 16.0)
          }
        }
      }
      
    }
    .padding(.horizontal)
    .padding(.bottom)
  }
  
  fileprivate func topRatedListView() -> some View {
    
    return ScrollView(.vertical) {
      VStack(spacing: 8) {
        ForEach($viewModel.state.toprated.wrappedValue, id: \.self) { toprated in
          NavigationLink(destination: movieRouter.view(for: .openDetail(toprated.id ?? -1), with: viewModel.state.service)) {
            MovieRowCard(movie: toprated)
              .padding(.bottom, 16.0)
          }
        }
        
      }
      
    }
    .padding(.horizontal)
  }
  
  var body: some View {
    
    NavigationView {
      
      ZStack {
        
        Color.black.opacity(0.85).edgesIgnoringSafeArea(.all)
        //        NavigationLink(destination: viewModel.viewRouter.view(for: .openDetail($isPresented, $selectedMovieId.wrappedValue ?? 0), with: viewModel.networkManager) ) {
        VStack(spacing: 20) {
          
         // SearchBar(viewModel: viewModel).padding(.horizontal, 32)
         
          ScrollView {
            
            VStack(alignment: .leading) {
              
              Text("UPCOMINNG").foregroundColor(.white).bold().padding()
              upcomingListView()
              
              
              Text("TRENDING").foregroundColor(.white).bold().padding()
              topRatedListView()
              
              
          
             /*
              Text(($viewModel.state.searchResult.wrappedValue.count > 1 ? "" : "😐 NO") + "Search Result".uppercased()).foregroundColor(.white).bold().padding()
              
              // If section 1&2 hidden
              ScrollView(.vertical) {
                
                VStack(spacing: 8) {
                  
                  ForEach($viewModel.state.searchResult.wrappedValue, id: \.self) { searchItem in
                    Button(action: {
                      isPresented = true
                      selectedMovieId = searchItem.id
                    }) {
                      MovieRowCard(movie: searchItem)
                    }.padding(.bottom, 16.0)
                    
                  }
                  
                }
                
              }.padding(.horizontal)
              */
            }
          }
        }
      }
      .navigationBarHidden(true)
//      .fullScreenCover(isPresented: $isPresented, onDismiss: nil) {
//        movieRouter.view(for: .openDetail(self.selectedMovieId), with: viewModel.state.service)
//      }
//      .sheet(isPresented: self.$isPresented) {
//        movieRouter.view(for: .openDetail($isPresented, ), with: viewModel.state.service)
//      }
    }
    .onAppear(perform: fetch)
    
  }
  
  private func fetch(){
    viewModel.loadUpcomingMovies()
    viewModel.loadTopRatedMovies()
  }
  
}

//struct MovieListView_Previews: PreviewProvider {
//  static var previews: some View {
//    MovieListView(viewModel: MovieListViewModel(router: LoginRouter(), networkManager: NetworkManager()))
//  }
//}
