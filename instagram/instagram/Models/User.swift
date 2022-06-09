//
//  User.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import Foundation

class User: Identifiable {
    var id = UUID().uuidString
    var name = ""
    var first = ""
    var last = ""
    var image = ""
    var isVerified = true
    var posts: [Post] = []
    var followers = "82M"
    var followedBy = "Followed by **therock** and **275 others**"
    var following = "347"
    var bio =   """
                @pilotwavemotionpictures
                🌈 meet GOODLES - Mac & Cheese that is just gooder!
                goodies.com/
                """
    
    var postCount: String {
        posts.count.description
    }
    var fullname: String {
        first + " " + last
    }
    
    init(name: String, first: String, last: String, image: String, posts: [Post]) {
        self.name = name
        self.first = first
        self.last = last
        self.image = image
        self.posts = posts
    }
    
    func userPostPairs() -> [(User, Post)] {
        posts.map { (self, $0) }
    }
}

struct Users {
    static let therock = User(name: "therock", first: "Dwayne", last: "Johnson", image: "TR Profile Pic", posts: [
                                    Posts.rockPost1,
                                    Posts.rockPost2,
                                    Posts.rockPost3
                                 ])
    static let obama = User(name: "barackobama", first: "Barack", last: "Obama", image: "BO Profile Pic", posts: [
                                    Posts.obamaPost1,
                                    Posts.obamaPost2,
                                    Posts.obamaPost3
                                 ])
    static let kevinHart = User(name: "kevin4real", first: "Kevin", last: "Hart", image: "KH Profile Pic", posts: [
                                    Posts.kevinHartPost1,
                                    Posts.kevinHartPost2,
                                    Posts.kevinHartPost3
                                ])
    static let galGadot = User(name: "gal_gadot", first: "Gal", last: "Gadot", image: "GG Profile Pic", posts: [
                                    Posts.galGadotPost1,
                                    Posts.galGadotPost2,
                                    Posts.galGadotPost3
                                ])
    static let blakeLively = User(name: "blakelively", first: "Blake", last: "Lively", image: "BL Profile Pic", posts: [
                                    Posts.blakeLivelyPost1,
                                    Posts.blakeLivelyPost2,
                                    Posts.blakeLivelyPost3
                                ])
    static let sushmitaSen = User(name: "sushmitasen47", first: "Sushmita", last: "Sen", image: "SS Profile Pic", posts: [
                                    Posts.sushmitaSen1,
                                    Posts.sushmitaSen2,
                                    Posts.sushmitaSen3
                                ])
    
    static let all = [
                        therock,
                        obama,
                        kevinHart,
                        galGadot,
                        blakeLively,
                        sushmitaSen
                     ]
    
    static let allUserPostPairs = all.compactMap { $0.userPostPairs }
}
