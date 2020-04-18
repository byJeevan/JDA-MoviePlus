//
//  ViewRouter.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

enum PageId {
    case login
    case home
    case registration
}

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>() // passes its data to any view that’s observing. i.e. RootView in our case.
    var currentPageId:PageId = .login {
        didSet {
             objectWillChange.send(self)
        }
    }
    
}
