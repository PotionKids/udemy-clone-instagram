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
    
//    static func fetch(userWithID uid: String, completion: @escaping (User) -> Void) {
//        Constants
//            .collectionUsers
//            .document(uid)
//            .getDocument { snapshot, _ in
//                guard let user = try? snapshot?.data(as: User.self) else { return }
//                completion(user)
//            }
//    }
    
    static func fetch(followingForUserID uid: String, completion: @escaping ([String]) -> Void) {
        Constants.collectionFollowing
            .document(uid)
            .collection(Constants.userFollowing)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {
                    print("DEBUG: FAILURE: User following documents not found in Firestore.")
                    return
                }
                guard let followingIDs = documents as? [String] else { return }
                completion(followingIDs)
        }
    }
    
//    static func fetch(postsForUserID uid: String, completion: @escaping ([String]) -> Void) {
//        Constants.collectionPosts
//            .document(uid)
//            .
//    }
}
