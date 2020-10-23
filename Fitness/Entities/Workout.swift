//
//  Workout.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/20/20.
//

import Foundation
import Firebase

class Workout {
    
    var _id: String!
    var desc: String!
    var title: String!
    var duration: Time!
    var type: Workouts.ID!
    var distance: Distance!
    var reference: DocumentReference?
    
    required init() {
        let ref = Firestore.firestore().collection("workouts").document()
        self.reference = ref
        self._id = ref.documentID
    }
    
    
    /// Converts data to dictionary
    func toDictionary() -> [String: Any] {
        return [
            "_id": self._id!,
            "reference": self.reference!,
            "desc": self.desc ?? NSNull(),
            "title": self.title ?? NSNull(),
            "type": self.type?.rawValue ?? NSNull(),
            "distance": self.distance.distance ?? NSNull(),
            "distanceUnit": self.distance?.unit.rawValue ?? NSNull(),
            "duration": self.timeToSeconds(self.duration) ?? NSNull(),
        ]
    }
    
    
    /// Adds data to Firestore
    func toFirestore(_ completion: @escaping (_ error: Error?) -> Void) {
        self.reference?.setData(self.toDictionary(), merge: true, completion: { (error) in
            completion(error)
        })
    }
    
    
    // MARK: - PRIVATE
    
    /// Converts `Time` to seconds
    private func timeToSeconds(_ time: Time) -> NSNumber? {
        var totalSeconds: Double = 0
        
        if let msec = time.milliseconds { totalSeconds += msec }
        if let sec = time.seconds { totalSeconds += sec }
        if let min = time.minutes { totalSeconds += min * 60 }
        if let hours = time.hours { totalSeconds += hours * 3600 }
        
        return totalSeconds == 0 ? nil : NSNumber(value: totalSeconds)
    }
    
}
