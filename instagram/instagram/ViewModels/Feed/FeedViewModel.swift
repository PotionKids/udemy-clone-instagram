//
//  FeedViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/21/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var feed: [String: [Post]] = [:]
    @Published var following: [String] = []
    
    var current: User? {
        AuthViewModel.shared.user
    }
    
    var userPostPairs: [UserPost] {
        var pairs = [UserPost]()
        for (uid, posts) in feed {
            UserService.fetch(userWithID: uid) { user in
                pairs += posts.map { UserPost(user: user, post: $0) }
            }
        }
        return pairs
    }
    
    init() {
        fetchFollowing()
        fetchFeed()
    }
    
    func fetchFollowing() {
        guard let user = current,
              let uid = user.id
        else { return }
        UserService.fetch(followingForUserID: uid) { followingIDs in
//            print(LOGGING.DEBUG.SUCCESS.log(message: "Following IDs: \(followingIDs)"))
            self.following = followingIDs
            print(LOGGING.DEBUG.SUCCESS.log(message: "Following IDs: \(self.following)"))
        }
    }
    
    func fetchFeed() {
        for uid in self.following {
            UserService.fetch(postsForUserID: uid) { posts in
                self.feed[uid] = posts
                print(LOGGING.DEBUG.SUCCESS.log(message: "feed posts for followingID: \(uid) are : \(posts)"))
            }
        }
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
