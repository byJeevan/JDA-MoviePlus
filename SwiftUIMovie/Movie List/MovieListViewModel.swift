//
//  MovieListViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI


// https://api.themoviedb.org/3/search/movie?api_key=d156ee8a7d88cc93de2b0c5fb01ba511&language=en-US&query=movie&page=1&include_adult=false&region=india

/*
 * View Model class for Movie List (Home page)
 */
class MovieListViewModel:ObservableObject, Identifiable {
    var networkManager: NetworkManager!
    var id: String = UUID().uuidString

    let viewRouter:ViewRouter!
    @Published var isLoading = false
    @Published var allShows:[ShowsApiResponse] = []
    private var pageCounter = 1
    
    init(router:ViewRouter, networkManager:NetworkManager) {
        self.viewRouter = router
        self.networkManager = networkManager
        self.loadMovies()
    }
    
    func loadMovies(){
        self.isLoading = true
        
        self.networkManager.getAllShows(page: pageCounter) { movies, error in
            DispatchQueue.main.async {
                if error == nil {
                    self.isLoading = false
                    self.allShows = movies ?? [ShowsApiResponse]()
                }
            }
            
        }
    }
}



