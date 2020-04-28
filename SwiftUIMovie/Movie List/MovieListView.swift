//
//  MovieListView.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//
import Foundation
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
                 
          
                ForEach( (0...self.$movieListViewModel.allShows.wrappedValue.count) , id: \.self) { show in
                            Text("\(show) .")
                }
                 
//                GridStack(rows: 4, columns: 4) { row, col in
//                    Image(systemName: "\(row * 4 + col).circle")
//                    Text("R\(row) C\(col)")
//                }
                
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


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}


 
