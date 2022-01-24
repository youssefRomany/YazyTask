//
//  OfferDataViewModel.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import Foundation

struct OfferDataViewModel {
    
    let offer: Offers
    
    init(offer: Offers) {
        self.offer = offer
    }
    
    var id: Int {
        guard let id = offer.id else { return 0 }
        return id
    }
    
    var title: String {
        guard let title = offer.title else { return "" }
        return title
    }
    
    var destination: String {
        guard let destination = offer.destination else { return "" }
        return destination
    }
    
    var duration: String {
        guard let duration = offer.duration else { return "" }
        return duration
    }
    
    var price: Float {
        guard let price = offer.price else { return 0 }
        return price
    }
    
    var currency: String {
        guard let currency = offer.currency else { return "" }
        return currency
    }
    
    var priceWithCurrency: String {
        return "\(price) \(currency)"
    }
    
    var favouriteCount: Int {
        guard let favouriteCount = offer.favouriteCount else { return 0 }
        return favouriteCount
    }
    
    var multiCities: Int {
        guard let multiCities = offer.multiCities else { return 0 }
        return multiCities
    }
    
    var isMultiCities: Bool {
        return multiCities > 0
    }
    
    var image: String {
        guard let image = offer.image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return ""
        }
        return image
    }
    
    var imageUrl: URL? {
        guard let url = URL(string: image) else {
            return nil
        }
        return url
    }
}
