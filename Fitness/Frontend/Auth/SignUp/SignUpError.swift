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
        case passwordMatch
        case passwordTooShort
        case usernameTooShort
        case usernameTooLong
        case usernameTaken
        case invalidUsername
        case usernameIncomplete
        case general
        
        public var errorDescription: String? {
            switch self {
            case .empty:
                return NSLocalizedString("Fields cannot be empty.", comment: "Empty Field")
            case .usernameTooShort:
                return NSLocalizedString("Username must be at least 5 characters.", comment: "Username Too Short")
            case .passwordTooShort:
                return NSLocalizedString("Password must be at least 6 characters.", comment: "Password Too Short")
            case .usernameTooLong:
                return NSLocalizedString("Username must be less than 20 characters", comment: "Username Too Long")
            case .invalidUsername:
                return NSLocalizedString("Username contains an invalid character.", comment: "Invalid Username")
            case .usernameIncomplete:
                return NSLocalizedString("We were unable to validate your username. Please try again later.", comment: "Username Validation Incomplete")
            case .usernameTaken:
                return NSLocalizedString("Username is taken.", comment: "Username Taken")
            case .passwordMatch:
                return NSLocalizedString("Your passwords do not match.", comment: "Passwords Do Not Match")
            case .general:
                return NSLocalizedString("Uh-oh! Something went wrong. Please try again later.", comment: "General Error")
            }
        }
        
    }
    
}
