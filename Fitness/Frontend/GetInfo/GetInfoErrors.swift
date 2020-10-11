//
//  SignUpErrors.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/9/20.
//

import Foundation

extension GetInfoInteractor {
    
    enum GetInfoError: Error, LocalizedError {
        
        case empty
        case invalidEmail
        case nameTooLong
        case invalidDate
        case emailTaken
        case general
        
        public var errorDescription: String? {
            switch self {
            case .empty:
                return NSLocalizedString("Fields cannot be empty.", comment: "Empty Field")
            case .invalidEmail:
                return NSLocalizedString("Please enter a valid email.", comment: "Invalid Email")
            case .nameTooLong:
                return NSLocalizedString("The name you entered exceeds the character limit.", comment: "Name Too Long")
            case .invalidDate:
                return NSLocalizedString("Date format is not valid.", comment: "Invalid Date Format")
            case .emailTaken:
                return NSLocalizedString("The email you entered is already being used.", comment: "Email Taken")
            case .general:
                return NSLocalizedString("Uh-oh! Something went wrong. Please try again later.", comment: "Error")
            }
        }
        
    }
    
}
