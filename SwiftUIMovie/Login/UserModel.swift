//
//  UserModel.swift
//  SwiftUIMovie
//
//  Created by Jeevan-1382 on 18/04/20.
//  Copyright © 2020 Jeevan-1382. All rights reserved.
//

import Foundation


class UserModel:Codable {
    var userName:String? = "admin"
    var password:String?
    var isRegistered:Bool?
}
