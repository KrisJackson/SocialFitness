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
        case general
        
        public var errorDescription: String? {
            switch self {
            case .empty:
                return NSLocalizedString("Fields cannot be empty.", comment: "Empty Field")
            case .general:
                return NSLocalizedString("Uh-oh! Something went wrong. Please try again later.", comment: "Error")
            }
        }
        
    }
}
