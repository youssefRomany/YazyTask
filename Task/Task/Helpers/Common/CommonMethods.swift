//
//  CommonMethods.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//
import Foundation
import SwiftMessages
import Kingfisher


//MARK: - handle message toast
public func displayMessage(message: String, messageError: Bool) {
    
    let view = MessageView.viewFromNib(layout: .cardView)
    if messageError == true {
        view.configureTheme(.error)
    } else {
        view.configureTheme(.success)
    }
    

    view.titleLabel?.isHidden = true
    view.bodyLabel?.text = message
    view.titleLabel?.textColor = UIColor.white
    view.bodyLabel?.textColor = UIColor.white
    view.button?.isHidden = true
    //view.bodyLabel?.font = UIFont(name: localizedSitringFor(key: FontLocalizedName.BoldFont.rawValue), size: iphoneXFactor*45)
    view.alpha = 0.9
    var config = SwiftMessages.Config()
    config.presentationStyle = .bottom
    SwiftMessages.show(config: config, view: view)
}


public func setImageView(forImageView imageView: UIImageView, andURL url: URL, andPlaceHolderImage placeholder: String){
    imageView.kf.indicatorType = .activity
    imageView.kf.setImage(with: url, placeholder: UIImage(named: placeholder))
}
