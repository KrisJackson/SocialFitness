//
//  KeyWindow.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import UIKit

let keyWindow = UIApplication.shared.connectedScenes
    .filter({$0.activationState == .foregroundActive})
    .map({$0 as? UIWindowScene})
    .compactMap({$0})
    .first?.windows
    .filter({$0.isKeyWindow}).first
