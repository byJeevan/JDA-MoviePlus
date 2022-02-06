//
//  RoutingProtocol.swift
//  SwiftUIMovie
//
//  Created by Jeevan Rao on 04/02/22.
//  Copyright © 2022 Jeevan-1382. All rights reserved.
//


import SwiftUI

protocol Routing {
  associatedtype Route
  associatedtype Service
  associatedtype View: SwiftUI.View
  
  @ViewBuilder func view(for route: Route, with service: Service) -> Self.View
}
