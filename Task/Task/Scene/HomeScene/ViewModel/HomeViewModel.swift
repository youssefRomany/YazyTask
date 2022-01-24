//
//  HomeViewModel.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import Foundation

protocol HomeViewModelProtocol {
    var promotedOffer: Bindable<[OfferDataViewModel]> { get }
    var popularCountryListVM: Bindable<[CountryDataViewModel]> { get }
    var continentsSectionsVM: Bindable<[(String, [OfferDataViewModel])]> { get }
    
    func getContinentOffers()
}

class HomeViewModel: BaseViewModelProtocol, HomeViewModelProtocol {
    
    
    var showLoading: Bindable<Bool> = Bindable(false)
    
    var onShowMessage: ((String, Bool) -> Void)?
    
    var promotedOffer: Bindable<[OfferDataViewModel]> = Bindable([])
    
    var popularCountryListVM: Bindable<[CountryDataViewModel]> = Bindable([])
    
    var continentsSectionsVM: Bindable<[(String, [OfferDataViewModel])]> = Bindable([])
    
    let repo: OfferRepoProtocol
    init(repo: OfferRepoProtocol = OfferRepo()) {
        self.repo = repo
    }
    
    func getContinentOffers(){
        showLoading.value = true
        repo.getContinentOffers { [weak self] result in
            self?.showLoading.value = false
            switch result {
            case .success(let continentOffers):
                print("Response: \(continentOffers)")
                self?.populateHomeDate(model: continentOffers)
            case .failure(let error):
                print("Error: \(error)")
                if let errors = error as? TKError {
                    self?.onShowMessage?(errors.getErrorMessage() ?? "Unknown Error", true)
                }else {
                    self?.onShowMessage?("Unknown Error", true)
                }
            }
        }
    }
    
    private func populateHomeDate(model: ContinentOffersModel) {
        populateCountryListVM(list: model.popularCountryList ?? [])
        if let offerData = model.data {
            populateContinentsSectionsVM(offersData: offerData)
        }
    }
    
    private func populateCountryListVM(list: [PopularCountryList]) {
        popularCountryListVM.value = list.compactMap({CountryDataViewModel(country: $0)})
        
    }
    
    private func populateContinentsSectionsVM(offersData: OffersData) {
        appendContinentSections(name: "Africa", list: offersData.offersAfrica ?? [])
        appendContinentSections(name: "Asia", list: offersData.offersAsia ?? [])
        appendContinentSections(name: "Antartica", list: offersData.offersAntartica ?? [])
        appendContinentSections(name: "Australia", list: offersData.offersAustralia ?? [])
        appendContinentSections(name: "Europe", list: offersData.offersEurope ?? [])
        appendContinentSections(name: "NAmerica", list: offersData.offersNAmerica ?? [])
        appendContinentSections(name: "SAmerica", list: offersData.offersSAmerica ?? [])
    }
    
    
    private func appendContinentSections(name: String, list: [Offers]) {
        if list.count > 0 {
            continentsSectionsVM.value += [(name, list.compactMap({OfferDataViewModel(offer: $0)}))]
        }
        
    }
    
}
