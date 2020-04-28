//
//  Shows.swift
//  JDANetworkLayer
//
//  Created by Jeevan on 25/04/20.
//  Copyright © 2020 jda. All rights reserved.
//

import Foundation


struct ShowsApiResponse : Codable  {
    let id : Int?
    let url : String?
    let name : String?
    let type : String?
    let language : String?
    let genres : [String]?
    let status : String?
    let runtime : Int?
    let premiered : String?
    let officialSite : String?
    let schedule : Schedule?
    let rating : Rating?
    let weight : Int?
    let network : Network?
    let webChannel : WebChannel?
    let externals : Externals?
    let image : ImageOfShow?
    let summary : String?
    let updated : Int?
    let _links : ShowLinks?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case url = "url"
        case name = "name"
        case type = "type"
        case language = "language"
        case genres = "genres"
        case status = "status"
        case runtime = "runtime"
        case premiered = "premiered"
        case officialSite = "officialSite"
        case schedule = "schedule"
        case rating = "rating"
        case weight = "weight"
        case network = "network"
        case webChannel = "webChannel"
        case externals = "externals"
        case image = "image"
        case summary = "summary"
        case updated = "updated"
        case _links = "_links"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        genres = try values.decodeIfPresent([String].self, forKey: .genres)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
        premiered = try values.decodeIfPresent(String.self, forKey: .premiered)
        officialSite = try values.decodeIfPresent(String.self, forKey: .officialSite)
        schedule = try values.decodeIfPresent(Schedule.self, forKey: .schedule)
        rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
        weight = try values.decodeIfPresent(Int.self, forKey: .weight)
        network = try values.decodeIfPresent(Network.self, forKey: .network)
        webChannel = try values.decodeIfPresent(WebChannel.self, forKey: .webChannel)
        externals = try values.decodeIfPresent(Externals.self, forKey: .externals)
        image = try values.decodeIfPresent(ImageOfShow.self, forKey: .image)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        updated = try values.decodeIfPresent(Int.self, forKey: .updated)
        _links = try values.decodeIfPresent(ShowLinks.self, forKey: ._links)
    }
    
}

struct Schedule : Codable {
    let time : String?
    let days : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case time = "time"
        case days = "days"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        days = try values.decodeIfPresent([String].self, forKey: .days)
    }
    
}

struct Rating : Codable {
    var average : String?
    
    enum CodingKeys: String, CodingKey {
        
        case average = "average"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        average = try values.decodeIfPresent(String.self, forKey: .average)
         if let _average = try? values.decodeIfPresent(String.self, forKey: .average) {
            average = _average
         }
         else if let _average = try? values.decodeIfPresent(Int.self, forKey: .average) {
            average = "\(_average)"
        }
         
    }
    
}


struct Previousepisode : Codable {
    let href : String?
    
    enum CodingKeys: String, CodingKey {
        
        case href = "href"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        href = try values.decodeIfPresent(String.self, forKey: .href)
    }
    
}


struct ShowLinks : Codable {
    let selfShow : SelfShow?
    let previousepisode : Previousepisode?
    
    enum CodingKeys: String, CodingKey {
        
        case selfShow = "self"
        case previousepisode = "previousepisode"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        selfShow = try values.decodeIfPresent(SelfShow.self, forKey: .selfShow)
        previousepisode = try values.decodeIfPresent(Previousepisode.self, forKey: .previousepisode)
    }
    
}

struct SelfShow : Codable {
    let href : String?
    
    enum CodingKeys: String, CodingKey {
        
        case href = "href"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        href = try values.decodeIfPresent(String.self, forKey: .href)
    }
    
}

struct Country : Codable {
    let name : String?
    let code : String?
    let timezone : String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case code = "code"
        case timezone = "timezone"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
    }
    
}

struct WebChannel : Codable {
    let id : Int?
    let name : String?
    let country : Country?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case country = "country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(Country.self, forKey: .country)
    }
    
}


struct Network : Codable {
    let id : Int?
    let name : String?
    let country : Country?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case country = "country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(Country.self, forKey: .country)
    }
    
}





struct Externals : Codable {
    let tvrage : Int?
    let thetvdb : Int?
    let imdb : String?
    
    enum CodingKeys: String, CodingKey {
        
        case tvrage = "tvrage"
        case thetvdb = "thetvdb"
        case imdb = "imdb"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tvrage = try values.decodeIfPresent(Int.self, forKey: .tvrage)
        thetvdb = try values.decodeIfPresent(Int.self, forKey: .thetvdb)
        imdb = try values.decodeIfPresent(String.self, forKey: .imdb)
    }
    
}

struct ImageOfShow : Codable {
    let medium : String?
    let original : String?
    
    enum CodingKeys: String, CodingKey {
        
        case medium = "medium"
        case original = "original"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        medium = try values.decodeIfPresent(String.self, forKey: .medium)
        original = try values.decodeIfPresent(String.self, forKey: .original)
    }
    
}


