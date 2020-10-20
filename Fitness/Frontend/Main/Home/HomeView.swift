//
//  HomeView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    lazy var presenter = HomePresenter(from: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure logo
        self.logoImage.tintColor = .systemPink
        self.logoImage.contentMode = .scaleAspectFit
        self.logoImage.image = UIImage(systemName: "leaf.fill")

        // Configure create button
        self.workoutButton.tintColor = .black
        self.workoutButton.setImage(UIImage(systemName: "plus"), for: .normal)
        self.workoutButton.setPreferredSymbolConfiguration(
            .init(pointSize: 22, weight: .regular), forImageIn: .normal)
        
        // Configure message button
        self.messageButton.tintColor = .black
        self.messageButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        self.messageButton.setPreferredSymbolConfiguration(
            .init(pointSize: 22, weight: .regular), forImageIn: .normal)
       
    }

    
}

// MARK: - Actions
extension HomeView {
    
    @IBAction func workoutPressed(_ sender: Any) {
        self.presenter.routeToWorkout()
    }
    
    @IBAction func messagePressed(_ sender: Any) {
        
    }
    
}
