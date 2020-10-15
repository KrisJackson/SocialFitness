//
//  LoginError.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/15/20.
//

import Foundation

extension LoginInteractor {
    
    enum LoginError: Error, LocalizedError {
        
        case empty
        
        public var errorDescription: String? {
            switch self {
            case .empty:
                return NSLocalizedString("Fields cannot be empty.", comment: "Empty Field")
            }
        }
        
    }
}
