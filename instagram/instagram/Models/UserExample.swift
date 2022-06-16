//
//  User.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import Foundation

class UserExample: Identifiable {
    var id = UUID().uuidString
    var name = ""
    var first = ""
    var last = ""
    var image = ""
    var isVerified = true
    var posts: [PostExample] = []
    var stories: [PostExample] = [PostsExample.galGadotStory1, PostsExample.galGadotStory2, PostsExample.galGadotStory3]
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
    
    init(name: String, first: String, last: String, image: String, posts: [PostExample]) {
        self.name = name
        self.first = first
        self.last = last
        self.image = image
        self.posts = posts
    }
    
    func userPostPairs() -> [(UserExample, PostExample)] {
        posts.map { (self, $0) }
    }
}

struct UsersExample {
    static let therock = UserExample(name: "therock", first: "Dwayne", last: "Johnson", image: "TR Profile Pic", posts: [
                                    PostsExample.rockPost1,
                                    PostsExample.rockPost2,
                                    PostsExample.rockPost3
                                 ])
    static let obama = UserExample(name: "barackobama", first: "Barack", last: "Obama", image: "BO Profile Pic", posts: [
                                    PostsExample.obamaPost1,
                                    PostsExample.obamaPost2,
                                    PostsExample.obamaPost3
                                 ])
    static let kevinHart = UserExample(name: "kevin4real", first: "Kevin", last: "Hart", image: "KH Profile Pic", posts: [
                                    PostsExample.kevinHartPost1,
                                    PostsExample.kevinHartPost2,
                                    PostsExample.kevinHartPost3
                                ])
    static let galGadot = UserExample(name: "gal_gadot", first: "Gal", last: "Gadot", image: "GG Profile Pic", posts: [
                                    PostsExample.galGadotPost1,
                                    PostsExample.galGadotPost2,
                                    PostsExample.galGadotPost3
                                ])
    static let blakeLively = UserExample(name: "blakelively", first: "Blake", last: "Lively", image: "BL Profile Pic", posts: [
                                    PostsExample.blakeLivelyPost1,
                                    PostsExample.blakeLivelyPost2,
                                    PostsExample.blakeLivelyPost3
                                ])
    static let sushmitaSen = UserExample(name: "sushmitasen47", first: "Sushmita", last: "Sen", image: "SS Profile Pic", posts: [
                                    PostsExample.sushmitaSen1,
                                    PostsExample.sushmitaSen2,
                                    PostsExample.sushmitaSen3
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
