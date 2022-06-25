//
//  FeedViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/21/22.
//

import Foundation

typealias Feed = [String: [Post]]

class FeedViewModel: ObservableObject {
    @Published var feed: Feed = [:]
    @Published var following: [String] = []
    
    var current: User? {
        AuthViewModel.shared.user
    }
    
    var userPostPairs: [UserPost] = []
    
    init() {
        fetchFeed()
        print(LOGGING.DEBUG.SUCCESS.log(message: "User Post Pairs are : \(userPostPairs)"))
    }
    
    func fetchFeed() {
        UserService.fetch(followingForUserID: current?.id ?? "") { followingIDs in
            self.fetch(postsForUserIDs: followingIDs) { feed in
                self.feed = feed
                print(LOGGING.DEBUG.SUCCESS.log(message: "Feed is: \(self.feed)"))
                self.fetchUserPostPairs(for: self.feed) { pairs in
                    self.userPostPairs = pairs
                }
            }
        }
    }
    
    func fetch(postsForUserIDs uids: [String], completion: @escaping ([String : [Post]]) -> Void) {
        for uid in uids {
            UserService.fetch(postsForUserID: uid) { posts in
                self.feed[uid] = posts
//                print(LOGGING.DEBUG.SUCCESS.log(message: "Posts inside UserService fetch postsForUserIDs: \(posts)"))
//                print(LOGGING.DEBUG.SUCCESS.log(message: "Feed inside UserService fetch postsForUserIDs: \(self.feed)"))
                print(LOGGING.DEBUG.SUCCESS.log(message: "Feed inside FeedViewModel is: \(self.feed)"))
            }
            completion(feed)
        }
    }

    
    func fetchUserPostPairs(for feed: Feed, completion: @escaping ([UserPost]) -> Void) {
        var pairs = [UserPost]()
        for (uid, posts) in feed {
            UserService.fetch(userWithID: uid) { user in
                pairs += posts.map { UserPost(user: user, post: $0) }
            }
        }
        print(LOGGING.DEBUG.SUCCESS.log(message: "UserPost pairs: \(pairs)"))
        completion(pairs)
    }
}

struct UserPost: Identifiable {
    var id: String
    var user: User
    var post: Post
    
    init(user: User, post: Post) {
        self.user = user
        self.post = post
        self.id = user.id! + post.id!
    }
}
