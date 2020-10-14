//
//  MainTabBarView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import UIKit

class MainTabBarView: UITabBarController {
    
    lazy var presenter: MainTabBarPresenter = MainTabBarPresenter(from: self)

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
