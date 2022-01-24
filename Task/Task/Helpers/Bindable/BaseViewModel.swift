//
//  BaseViewModel.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import Foundation


protocol BaseViewModelProtocol {
    var showLoading: Bindable<Bool> { get set }
    var onShowMessage: ((_ alert: String,_ isError: Bool) -> Void)?  { get set }
}
