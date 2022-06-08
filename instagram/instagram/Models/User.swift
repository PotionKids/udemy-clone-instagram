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
    var firstName = ""
    var lastName = ""
    var profilePicFileName = ""
}

struct Users {
    static let therock = User(name: "therock", profilePicFileName: "TR Profile Pic")
    static let obama = User(name: "barackobama", profilePicFileName: "BO Profile Pic")
}
