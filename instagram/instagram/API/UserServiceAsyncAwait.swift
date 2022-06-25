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
    
    static func follow(_ followed: String, by current: String) async throws {
        try await Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followed)
            .setData([:])
        
        try await Constants.collectionFollowers
            .document(followed)
            .collection(Constants.userFollowers)
            .document(current)
            .setData([:])
    }
    
    static func unfollow(_ followed: String, by current: String) async throws {
        try await Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followed)
            .delete()
        
        try await Constants.collectionFollowers
            .document(followed)
            .collection(Constants.userFollowers)
            .document(current)
            .delete()
    }
    
    static func checkIfFollowed(_ followed: String, by current: String) async throws -> Bool {
        try await Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followed)
            .getDocument().exists
    }
    
    static func fetch(userWithID uid: String) async throws -> User {
        let snapshot = try await Constants.collectionUsers.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetch(followingForUserID uid: String) async throws -> [String] {
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
}

