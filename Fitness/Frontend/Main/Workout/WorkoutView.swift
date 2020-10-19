//
//  WorkoutView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import UIKit

struct WorkoutType {
    var name: String!
    var emoji: String!
}

class WorkoutView: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let workouts: [WorkoutType] = [
        .init(name: "Run", emoji: "🏃‍♂️"),
        .init(name: "Bike", emoji: "🚴‍♂️"),
        .init(name: "Lift", emoji: "🏋️‍♀️"),
        .init(name: "Swim", emoji: "🏊"),
        .init(name: "Walk", emoji: "🚶‍♀️"),
        .init(name: "Yoga", emoji: "🤸‍♂️"),
        .init(name: "Sprint", emoji: "🏃‍♀️"),
        .init(name: "Meditate", emoji: "🧘‍♂️"),
        .init(name: "Crossfit", emoji: "🏋️"),
        .init(name: "Cardio", emoji: "❤️"),
        .init(name: "Hike", emoji: "🥾"),
        .init(name: "Strength", emoji: "💪")
    ]
    
    lazy var presenter = WorkoutPresenter(from: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure collection view
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cellNib = UINib(nibName: WorkoutCell.reuseId, bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: WorkoutCell.reuseId)
        
        // Configure header label
        self.headerLabel.textColor = .black
        self.headerLabel.text = "Create new workout"
        self.headerLabel.font = .systemFont(ofSize: 28, weight: .heavy)
        
        // Configure subheader label
        self.subHeaderLabel.textColor = .secondaryLabel
        self.subHeaderLabel.font = .systemFont(ofSize: 16, weight: .regular)
        self.subHeaderLabel.text = "Select the type of workout that you would like to create."
        
        // Configure continue button
        self.continueButton.layer.cornerRadius = 12
        self.continueButton.backgroundColor = .systemPink
        self.continueButton.setTitle("Continue", for: .normal)
        self.continueButton.setTitleColor(.white, for: .normal)
        self.continueButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
    }
    
}

// MARK: - UI Collection View Delegate and Data Source


extension WorkoutView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workouts.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCell.reuseId, for: indexPath) as! WorkoutCell
        cell.iconLabel.text = workouts[indexPath.item].emoji
        cell.nameLabel.text = workouts[indexPath.item].name
        return cell
    }
    
}


// MARK: - UI Collection View Delegate Flow Layout


extension WorkoutView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsPerRow: CGFloat = 2
        let sidePadding: CGFloat = 20 * 2
        let spaceBetweenCell: CGFloat = 10
        
        let cellWidth: CGFloat = (view.frame.width - (sidePadding + spaceBetweenCell)) / cellsPerRow
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}


// MARK: - Actions


extension WorkoutView {
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.presenter.routeToPrevious()
    }
    
}
