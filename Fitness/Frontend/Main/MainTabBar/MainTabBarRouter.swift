//
//  MainTabBarRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import UIKit

class MainTabBarRouter {
    
    enum Destination {
        case auth
    }
    
    private var presenter: MainTabBarPresenter?
    
    required init(from delegate: MainTabBarPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .auth:
            let storyboard = UIStoryboard(name: "Auth", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "AuthNavigationView") as! AuthNavigationView
            vc.modalPresentationStyle = .fullScreen
            self.presenter?.view.present(vc, animated: false, completion: nil)
            break
        }
    }

}
