//
//  TabBarView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import Firebase

class TabBarView: UITabBarController {
    
    lazy var presenter: TabBarPresenter = TabBarPresenter(from: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        // Configure tabbar
        let appearance = tabBar.standardAppearance
        appearance.backgroundColor = .white
        appearance.stackedLayoutAppearance.normal.iconColor = .black
        appearance.stackedLayoutAppearance.selected.iconColor = .black
        self.tabBar.standardAppearance = appearance
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
