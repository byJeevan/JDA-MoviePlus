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
                LogoutButton(viewRouter:router)
            }.padding(Constants.Styles.pagePadding50)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListViewModel: MovieListViewModel(), router: ViewRouter())
    }
}

struct LogoutButton:View{
    @ObservedObject var viewRouter: ViewRouter
    
    var body:some View {
        
        Button(action: {
            self.viewRouter.currentPageId = .login
        }) {
            Text("LOGOUT")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background( Constants.Colors.buttonBlue)
                .cornerRadius(Constants.Styles.largeCornerRadius)
        }
    }
    
    /*
     NavigationLink(destination: MovieListView(), isActive:  $loginViewModel.isLoginEnable) {
     */
    
}
