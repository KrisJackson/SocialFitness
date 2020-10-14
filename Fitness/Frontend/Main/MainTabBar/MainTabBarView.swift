//
//  MainTabBarView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import Firebase

class MainTabBarView: UITabBarController {
    
    lazy var presenter: MainTabBarPresenter = MainTabBarPresenter(from: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Go to authentication if there is no user
        guard let _: User = Auth.auth().currentUser else {
            self.presenter.routeToAuth()
            return
        }
        
        
    }

}
