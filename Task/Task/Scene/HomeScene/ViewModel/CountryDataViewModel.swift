//
//  CountryDataViewModel.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import Foundation

struct CountryDataViewModel {
    
    let country: PopularCountryList
    init(country: PopularCountryList) {
        self.country = country
    }
    
    var title: String {
        guard let title = country.name_en else {
            return ""
        }
        return title
    }
    
    var image: String {
        guard let image = country.image?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
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
