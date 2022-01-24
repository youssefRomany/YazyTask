//
//  OfferApi.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import Foundation
import Moya

enum OfferEndPoints: String, CaseIterable {
    case GET_CONTINENT_OFFERS = "get-continent-offers"
}


enum OfferApi {
    case getContinentOffers
}


extension OfferApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Config.BASEURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getContinentOffers:
            return OfferEndPoints.GET_CONTINENT_OFFERS.rawValue
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getContinentOffers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getContinentOffers:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
