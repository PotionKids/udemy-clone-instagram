//
//  FeedViewModelAsyncAwait.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/26/22.
//

import Foundation

class FeedViewModelAsyncAwait: ObservableObject {
    @Published var userPostPairs: [UserPost] = []
    var feed: Feed = [:]
    var followingIDs: [String] = []
    var following: [String : User] = [:]
    
    var current: User? {
        AuthViewModel.shared.user
    }
    
    var currentUID: String {
        current?.id ?? ""
    }
    
    init() {
        Task {
            self.following = try await fetchFollowing()
            print(LOGGING.DEBUG.SUCCESS.log(message: "Following is \(self.following)"))
            self.feed = try await fetchFeed()
            print(LOGGING.DEBUG.SUCCESS.log(message: "Feed is \(self.feed)"))
            self.userPostPairs = UserPost.createUserPosts(from: self.following, andFeed: self.feed)
            print(LOGGING.DEBUG.SUCCESS.log(message: "User Post Pairs are : \(self.userPostPairs)"))
        }
    }
    
    func fetchFollowingIDs() async throws -> [String] {
        return try await UserServiceAsyncAwait.fetch(followingForUserID: currentUID)
    }
    
    func fetchFollowing() async throws -> [String : User] {
        return try await UserServiceAsyncAwait.fetch(usersWithIDs: try await fetchFollowingIDs())
    }
    
    func fetchFeed() async throws -> Feed {
        let followingIDs = try await UserServiceAsyncAwait.fetch(followingForUserID: currentUID)
        return try await UserServiceAsyncAwait.fetch(postsForUserIDs: followingIDs)
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
    
    static func createPairs(from users: [String : User], andFeed feed: Feed) -> [(User, Post)] {
        users.keys.reduce([(User, Post)]()) { pairs, uid in
            return pairs + feed[uid]!.map {(users[uid]!, $0)}
        }
    }
    
    static func createUserPosts(from pairs: [(User, Post)]) -> [UserPost] {
        pairs.map { UserPost(user: $0.0, post: $0.1) }
    }
    
    static func createUserPosts(from users: [String : User], andFeed feed: Feed) -> [UserPost] {
        createUserPosts(from: createPairs(from: users, andFeed: feed))
    }
}
