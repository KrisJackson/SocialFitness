//
//  MoreInfoInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/10/20.
//

import Firebase

class SignUpInteractor {
    
    var presenter: SignUpPresenter!
    
    required init(from delegate: SignUpPresenter) {
        self.presenter = delegate
    }
    
}
