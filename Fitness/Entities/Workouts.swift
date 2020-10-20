//
//  Workouts.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/19/20.
//

import Foundation

class Workouts {
    
    enum ID: Int {
        case run = 0
        case bike = 1
        case lift = 2
        case swim = 3
        case walk = 4
        case yoga = 5
        case sprint = 6
        case meditate = 7
        case crossfit = 8
        case cardio = 9
        case hike = 10
        case strength = 11
    }
    
    struct Info {
        var id: ID!
        var title: String!
        var emojiIcon: String!
    }
    
    static let list: [Workouts.Info] = [
        .init(id: .run, title: "Run", emojiIcon: "🏃‍♂️"),
        .init(id: .bike, title: "Bike", emojiIcon: "🚴‍♂️"),
        .init(id: .lift, title: "Lift", emojiIcon: "🏋️‍♀️"),
        .init(id: .swim, title: "Swim", emojiIcon: "🏊"),
        .init(id: .walk, title: "Walk", emojiIcon: "🚶‍♀️"),
        .init(id: .yoga, title: "Yoga", emojiIcon: "🤸‍♂️"),
        .init(id: .sprint, title: "Sprint", emojiIcon: "🏃‍♀️"),
        .init(id: .meditate, title: "Meditate", emojiIcon: "🧘‍♂️"),
        .init(id: .crossfit, title: "Crossfit", emojiIcon: "🏋️"),
        .init(id: .cardio, title: "Cardio", emojiIcon: "❤️"),
        .init(id: .hike, title: "Hike", emojiIcon: "🥾"),
        .init(id: .strength, title: "Strength", emojiIcon: "💪")
    ]
    
}
