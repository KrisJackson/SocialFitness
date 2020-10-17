//
//  LoginRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import UIKit

class LoginRouter {
    
    enum Destination {
        case previous
        case dismiss
    }
    
    private var presenter: LoginPresenter?
    
    required init(from delegate: LoginPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .previous:
            self.presenter?.view.navigationController?.popViewController(animated: true)
            break
            
        case .dismiss:
            self.presenter?.view.dismiss(animated: true, completion: nil)
            break
        }
    }
    
}
