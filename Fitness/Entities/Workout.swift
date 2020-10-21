//
//  Workout.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/20/20.
//

import Foundation

enum Unit: Int {
    case miles = 0
    case meter = 1
    case kilometer = 2
    case mph = 3
    case kph = 4
    case minPerMile = 5
    case minPerKilometer = 6
}

struct Distance {
    var distance: Double!
    var unit: Unit!
}

struct Time {
    var hours: Int!
    var minutes: Int!
    var seconds: Int!
}

class Workout {
    
    var title: String!
    var desc: String!
    var distance: Distance!
    var time: Time!
//    var
    
}
