//
//  MovieListViewModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import SwiftUI

/*
 * View Model class for Movie List (Home page)
 */
class MovieListViewModel:ObservableObject {
    var networkManager: NetworkManager!
    
    let viewRouter:ViewRouter!
    @Published var isLoading = false
    
    init(router:ViewRouter, networkManager:NetworkManager) {
        self.viewRouter = router
        self.networkManager = networkManager
        
    }
    
    func loadMovies(){
        self.isLoading = true
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.networkManager.getNewMovies(page: 1) { movies, error in
//                self.isLoading = false
                if error == nil {
                    print(movies)
                }
//            }
            
        }
    }
}



