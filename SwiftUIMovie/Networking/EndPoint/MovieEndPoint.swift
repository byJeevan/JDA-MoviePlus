//
//  MovieEndPoint.swift
//  NetworkLayer
//
//  Created by Malcolm Kumwenda on 2018/03/07.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
	case qa
	case production
	case staging
}

public enum MovieApi {
	case upcoming
	case topRated
	case movieDetail(movieId:Int)
	case searchMovie(searchKey:String)
}

extension MovieApi: EndPointType {

	var environmentBaseURL : String {
		switch NetworkManager.environment {
		case .production: return "https://api.themoviedb.org/3/movie/"
		case .qa: return "https://qa.themoviedb.org/3/movie/"
		case .staging: return "https://api.themoviedb.org/3"
		}
	}

	var baseURL: URL {
		guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
		return url
	}

	var path: String {
		switch self {
		case .upcoming:
			return "/movie/upcoming"
		case .topRated:
			return "/movie/top_rated"
		case .movieDetail(let movieId) :
			return "/movie/\(movieId)"
		case .searchMovie :
			return "/search/movie"
		}
	}

	var httpMethod: HTTPMethod {
		return .get
	}

	var task: HTTPTask {
		switch self {
		case .upcoming:
			return .requestParameters(bodyParameters: nil,
									  bodyEncoding: .urlEncoding,
									  urlParameters: ["api_key":Config.movieDBAPIKey,
													  "language" : Config.language_EN,
													  "adult" : false
									  ])
		case .topRated :
			return .requestParameters(bodyParameters: nil,
									  bodyEncoding: .urlEncoding,
									  urlParameters: ["api_key":Config.movieDBAPIKey,
													  "language" : Config.language_EN,
													  "adult" : false])

		case .movieDetail :
			return .requestParameters(bodyParameters: nil,
									  bodyEncoding: .urlEncoding,
									  urlParameters: ["api_key":Config.movieDBAPIKey,
													  "language" : Config.language_EN,
													  "adult" : false])
		case .searchMovie(let searchKey):
			return .requestParameters(bodyParameters: nil,
									  bodyEncoding: .urlEncoding,
									  urlParameters: ["api_key":Config.movieDBAPIKey,
													  "language" : Config.language_EN,
													  "adult" : false,
													  "query" : searchKey])
		}
	}

	var headers: HTTPHeaders? {
		return nil
	}
}


