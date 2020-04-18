//
//  MovieListView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import SwiftUI

/*
 * Movie list view will show list all movies
 */
struct MovieListView: View {
    @ObservedObject var movieListViewModel:MovieListViewModel
    let router:ViewRouter
    var body: some View {
        NavigationView {
            VStack {
                ActivityIndicator(shouldAnimate: self.$movieListViewModel.isLoading)
                FetchMoviesTempButton(movieListViewModel: movieListViewModel)
                LogoutButton(viewRouter:router)
            }.padding(Constants.Styles.pagePadding50)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListViewModel: MovieListViewModel(router: ViewRouter(), networkManager: NetworkManager()), router: ViewRouter())
    }
}

//MARK:- UI Elements
struct LogoutButton:View{
    @ObservedObject var viewRouter: ViewRouter
    
    var body:some View {
        Button(action: {
            self.viewRouter.currentPageId = .login
        }) {
            Text("Logout")
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 220, height: 60)
                .padding(Constants.Styles.bottomPadding20)
        }
    }
}

struct FetchMoviesTempButton:View{
    @ObservedObject var movieListViewModel:MovieListViewModel
    
    var body:some View {
        
        Button(action: {
            self.movieListViewModel.loadMovies()
        }) {
            Text("LOAD MOVIES")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(self.movieListViewModel.isLoading ? Color.gray : Color.black)
                .cornerRadius(Constants.Styles.largeCornerRadius)
        }.disabled(self.movieListViewModel.isLoading)
    }
    
}
