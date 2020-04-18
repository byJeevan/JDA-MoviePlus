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
    
    let viewRouter:ViewRouter!
    @Published var isLoading = false
    
    init(router:ViewRouter) {
        self.viewRouter = router
    }
    
    func loadMovies(){
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
             self.isLoading = false
        }
    }
}



