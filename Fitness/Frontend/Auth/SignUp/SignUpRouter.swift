//
//  MoreInfoRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/10/20.
//

import UIKit

class SignUpRouter {
    
    enum Destination {
        case previous
    }
    
    private var presenter: SignUpPresenter?
    
    required init(from delegate: SignUpPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .previous:
            
            self.presenter?.view.navigationController?.popViewController(animated: true)
            break
            
        }
    }
    
}
