//
//  User.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import Foundation

struct User: Identifiable {
    var id = UUID().uuidString
    var name = ""
    var first = ""
    var last = ""
    var image = ""
    var isVerified = false
    
    var fullname: String {
        first + " " + last
    }
}

struct Users {
    static let therock = User(name: "therock", first: "Dwayne", last: "Johnson", image: "TR Profile Pic", isVerified: true)
    static let obama = User(name: "barackobama", first: "Barack", last: "Obama", image: "BO Profile Pic", isVerified: true)
}
