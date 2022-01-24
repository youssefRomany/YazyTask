//
//  BaseViewController.swift
//  Task
//
//  Created by YoussefRomany on 24/01/2022.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {
    func showLoaderForController(){
        DispatchQueue.main.async(execute: {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        })
    }

    func hideLoaderForController(){
        DispatchQueue.main.async(execute: {
            MBProgressHUD.hide(for: self.view, animated: true)
        })
    }
    
}

