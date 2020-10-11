//
//  Users.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/9/20.
//

import Foundation
import Firebase

class UserStore {
    
    var _id: String?
    var name: String?
    var email: String?
    var created: Double?
    var username: String?
    var dateOfBirth: Double?
    var reference: DocumentReference?
    
    func toDictionary() -> [String: Any] {
        return [
            "_id": self._id ?? NSNull(),
            "name": self.name ?? NSNull(),
            "email": self.email ?? NSNull(),
            "created": self.created ?? NSNull(),
            "username": self.username ?? NSNull(),
            "dateOfBirth": self.dateOfBirth ?? NSNull(),
            "reference": self.reference ?? NSNull(),
        ]
    }
    
}
