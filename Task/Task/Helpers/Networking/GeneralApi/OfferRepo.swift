//
//  GeneralRepo.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import Foundation

protocol OfferRepoProtocol {
    func getContinentOffers(completionHandler: @escaping (Result<ContinentOffersModel, Error>)->())

}

class OfferRepo: OfferRepoProtocol {
    
    func getContinentOffers(completionHandler: @escaping (Result<ContinentOffersModel, Error>)->()) {
        RequestManager.beginRequest(withTarget: OfferApi.getContinentOffers, responseModel: ContinentOffersModel.self) { result in
            completionHandler(result)
        }
    }

}
