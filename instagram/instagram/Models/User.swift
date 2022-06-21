//
//  User.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/16/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Equatable, Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageURL: String
    var postIDs: [String] = []
    
    var isFollowed: Bool? = false
    
    
    var isCurrent: Bool {
        id == AuthViewModel.currentUID
    }
    
    var searchTerm: String {
        (username + " " + fullname).lowercased()
    }
    
    var followers: String {
        "82M"
    }
    var followedBy: String {
        "Followed by **therock** and **275 others**"
    }
    var following: String {
        "347"
    }
    var bio: String {
        """
        @pilotwavemotionpictures
        🌈 meet GOODLES - Mac & Cheese that is just gooder!
        goodies.com/
        """
    }
    
    var posts: [PostExample] {
        [
            PostsExample.galGadotPost1,
            PostsExample.galGadotPost2,
            PostsExample.galGadotPost3
        ]
    }
    
    var postCount: String {
        posts.count.description
    }
    
    var stories: [PostExample] {
        [
            PostsExample.galGadotStory1,
             PostsExample.galGadotStory2,
             PostsExample.galGadotStory3
        ]
    }
}
