//
//  WorkoutView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import UIKit

class WorkoutView: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selected: Workouts.ID? = nil
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
        self.continueButton.isEnabled = false
        self.continueButton.backgroundColor = #colorLiteral(red: 1, green: 0.2156862745, blue: 0.3725490196, alpha: 0.5)
        self.continueButton.layer.cornerRadius = continueButton.frame.height / 2
        self.continueButton.setTitle("Continue", for: .normal)
        self.continueButton.setTitleColor(.white, for: .normal)
        self.continueButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        
        /// Enables 'slide to dismiss' for views added to stack
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    
    }
    
}

// MARK: - UI Collection View Delegate and Data Source


extension WorkoutView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return Workouts.list.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCell.reuseId, for: indexPath) as! WorkoutCell
        self.presenter.populateData(for: cell, at: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.select(self.collectionView, at: indexPath.item)
    }
    
}


// MARK: - UI Collection View Delegate Flow Layout


extension WorkoutView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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
    
    @IBAction func continuePressed(_ sender: Any) {
        guard let selected = self.selected else {
            return
        }
        self.presenter.routeToWorkoutInfo(withData: selected)
    }
    
}


// MARK: - UIGesture Recognizer Delegate


extension WorkoutView: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        /// Prevents 'slide to dismis' for view on the root of stack
        if(navigationController!.viewControllers.count > 1) {
            return true
        }
        return false
    }
    
}


// MARK: - Presenter Functions

extension WorkoutView {
    
    func onSelect(selected: Workouts.ID?) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2) {
            self.continueButton.isEnabled = true
            self.continueButton.backgroundColor = .systemPink
            self.view.layoutIfNeeded()
        }
        self.selected = selected
        self.collectionView.reloadData()
    }
    
    func cellIsSelected(_ cell: WorkoutCell) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2) {
            cell.backView.backgroundColor = #colorLiteral(red: 1, green: 0.2156862745, blue: 0.3725490196, alpha: 0.3)
            self.view.layoutIfNeeded()
        }
    }
    
    func cellNotSelected(_ cell: WorkoutCell) {
        cell.backView.backgroundColor = .secondarySystemBackground
    }
    
}
