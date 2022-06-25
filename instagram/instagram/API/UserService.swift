//
//  UserService.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/18/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

typealias FirestoreCompletion = ((Error?) -> Void)

struct UserService {
    
    static func follow(_ followed: String, by current: String, completion: FirestoreCompletion?) {
        Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followed)
            .setData([:]) { _ in
                Constants.collectionFollowers
                    .document(followed).collection(Constants.userFollowers)
                    .document(current).setData([:], completion: completion)
            }
    }
    
    static func unfollow(_ followed: String, by current: String, completion: FirestoreCompletion?) {
        Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followed)
            .delete { _ in
                Constants.collectionFollowers
                    .document(followed)
                    .collection(Constants.userFollowers)
                    .document(current)
                    .delete(completion: completion)
            }
    }
    
    static func checkIfFollowed(_ followed: String, by current: String, completion: @escaping (Bool) -> Void) {
        Constants.collectionFollowing
            .document(current)
            .collection(Constants.userFollowing)
            .document(followed)
            .getDocument { snapshot, _ in
                guard let isFollowed = snapshot?.exists else { return }
                completion(isFollowed)
            }
    }
    
    static func fetch(userWithID uid: String, completion: @escaping (User) -> Void) {
        Constants
            .collectionUsers
            .document(uid)
            .getDocument { snapshot, _ in
                guard let user = try? snapshot?.data(as: User.self) else { return }
                completion(user)
            }
    }
    
    static func fetch(followingForUserID uid: String, completion: @escaping ([String]) -> Void) {
        Constants.collectionFollowing
            .document(uid)
            .collection(Constants.userFollowing)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {
                    print("DEBUG: FAILURE: User following documents not found in Firestore.")
                    return
                }
                print(LOGGING.DEBUG.SUCCESS.log(message: "Fetched document: \(documents)"))
                let followingIDs = documents.compactMap {$0.documentID}
                print(LOGGING.DEBUG.SUCCESS.log(message: "Fetched followingIDs: \(followingIDs)"))
                completion(followingIDs)
        }
    }
    
    static func fetch(postsForUserID uid: String, completion: @escaping ([Post]) -> Void) {
        print(LOGGING.DEBUG.SUCCESS.log(message: "Fetching posts for user id: \(uid)"))
        var posts = [Post]()
        Constants.collectionPosts
            .document(uid)
            .collection(Constants.userPosts)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {
                    print(LOGGING.DEBUG.FAILURE.log(message: "Could not fetch posts for user with id: \(uid)"))
                    return
                }
                print(LOGGING.DEBUG.SUCCESS.log(message: "Fetched posts for user with id: \(uid)"))
                posts = documents.compactMap {try? $0.data(as: Post.self)}
                print(LOGGING.DEBUG.SUCCESS.log(message: "Posts for user with id: \(uid) are : \(posts)"))
                completion(posts)
            }
    }
    
    static func fetch(postsForUserIDs uids: [String], completion: @escaping ([String : [Post]]) -> Void) {
        var feed: [String: [Post]] = [:]
        for uid in uids {
            UserService.fetch(postsForUserID: uid) { posts in
                feed[uid] = posts
                print(LOGGING.DEBUG.SUCCESS.log(message: "Posts inside UserService fetch postsForUserIDs: \(posts)"))
                print(LOGGING.DEBUG.SUCCESS.log(message: "Feed inside UserService fetch postsForUserIDs: \(feed)"))
            }
            
            print(LOGGING.DEBUG.SUCCESS.log(message: "Feed inside UserService is: \(feed)"))
            completion(feed)
        }
    }
}
