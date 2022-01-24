//
//  ContinentOffersModel.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import Foundation

struct ContinentOffersModel : Codable {
    let status : Int?
    let message : String?
    let promotedOffers : [Offers]?
    let data : OffersData?
    let popularCountryList : [PopularCountryList]?
    let chatbot_link : String?


}
