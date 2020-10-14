//
//  SignUpRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import UIKit

class GetInfoRouter {
    
    enum Destination {
        case previous
        case signUp
    }
    
    private var presenter: GetInfoPresenter?
    
    required init(from delegate: GetInfoPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .signUp:
            
            let storyboard = UIStoryboard(name: "Auth", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "SignUpView") as! SignUpView
            if let user: UserStore = data as? UserStore { vc.user = user }
            self.presenter?.view.navigationController?.pushViewController(vc, animated: true)
            break
            
        case .previous:
            
            self.presenter?.view.navigationController?.popViewController(animated: true)
            break
            
        }
    }
    
}
