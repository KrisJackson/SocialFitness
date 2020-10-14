//
//  OpeningRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/7/20.
//

import UIKit

class OpeningRouter {
    
    enum Destination {
        case login
        case getInfo
    }
    
    private var presenter: OpeningPresenter?
    
    required init(from delegate: OpeningPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination) {
        switch destination {
        case .login:
            
            let storyboard = UIStoryboard(name: "Auth", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginView") as! LoginView
            self.presenter?.view.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .getInfo:
            
            let storyboard = UIStoryboard(name: "Auth", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "GetInfoView") as! GetInfoView
            self.presenter?.view.navigationController?.pushViewController(vc, animated: true)
            break
            
        }
    }
    
}
