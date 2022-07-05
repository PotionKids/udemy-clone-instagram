//
//  UserServiceAsyncAwait.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/25/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserServiceAsyncAwait {
    
    static func follow(_ followee: String, by current: String) async throws {
        try await Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followee)
            .setData([:])
        
        try await Constants.collectionFollowers
            .document(followee)
            .collection(Constants.userFollowers)
            .document(current)
            .setData([:])
    }
    
    static func unfollow(_ followee: String, by current: String) async throws {
        try await Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followee)
            .delete()
        
        try await Constants.collectionFollowers
            .document(followee)
            .collection(Constants.userFollowers)
            .document(current)
            .delete()
    }
    
    static func checkIfFollowed(_ followee: String, by current: String) async throws -> Bool {
        try await Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followee)
            .getDocument().exists
    }
    
    static func fetch(userWithID uid: String) async throws -> User {
        let snapshot = try await Constants.collectionUsers.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetch(usersWithIDs uids: [String]) async throws -> [String: User] {
        var users = [String : User]()
        try await withThrowingTaskGroup(of: [String : User].self) { group in
            for uid in uids {
                group.addTask {
                    return [uid : try await self.fetch(userWithID: uid)]
                }
            }
            for try await d in group {
                users.merge(d) { cur, _ in cur }
            }
        }
        return users
    }
    
    
    
    static func fetch(followeesForUserID uid: String) async throws -> [String] {
        let snapshot = try await Constants.collectionFollowing
            .document(uid)
            .collection(Constants.userFollowing)
            .getDocuments()
        
        return snapshot.documents.compactMap {$0.documentID}
    }
    
    static func fetch(postsForUserID uid: String) async throws -> [Post] {
        let snapshot = try await Constants.collectionPosts
            .document(uid)
            .collection(Constants.userPosts)
            .getDocuments()
        
        return try snapshot.documents.compactMap {try $0.data(as: Post.self)}
    }
    
    static func fetch(postsForUserIDs uids: [String]) async throws -> Feed {
        var feed: [String: [Post]] = [:]
        try await withThrowingTaskGroup(of: Feed.self) { group in
            for uid in uids {
                group.addTask {
                    return [uid: try await UserServiceAsyncAwait.fetch(postsForUserID: uid)]
                }
            }
            for try await d in group {
                feed.merge(d) { cur, _ in cur }
            }
        }
        return feed
    }
}

