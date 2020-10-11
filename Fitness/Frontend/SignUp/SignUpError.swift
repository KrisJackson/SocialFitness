//
//  MoreInfoError.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/10/20.
//

import Foundation

extension SignUpInteractor {
    
    enum SignUpError: Error, LocalizedError {
        
        case empty
        
        public var errorDescription: String? {
            switch self {
            case .empty:
                return NSLocalizedString("Fields cannot be empty.", comment: "Empty Field")
            }
        }
        
    }
    
}
