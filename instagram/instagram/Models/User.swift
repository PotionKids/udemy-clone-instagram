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
}

struct Users {
    static let therock = User(name: "therock", image: "TR Profile Pic")
    static let obama = User(name: "barackobama", image: "BO Profile Pic")
}
