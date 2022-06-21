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
    
//    static func fetch(userWithID uid: String) -> User? {
//        var user: User?
//        
//        Constants
//            .collectionUsers
//            .document(uid)
//            .getDocument { snapshot, _ in
//            guard let fetched = try? snapshot?.data(as: User.self) else { return }
//            print("DEBUG: User fetched: \(user)")
//            user = fetched
//        }
//        return user
//    }
//    
//    static func fetch(followingForUserID uid: String) -> [User] {
//        var following = [User]()
//        Constants.collectionFollowing
//            .document(uid)
//            .collection(Constants.userFollowing)
//            .getDocuments { snapshot, _ in
//                guard let documents = snapshot?.documents else {
//                    print("DEBUG: FAILURE: User following documents not found in Firestore.")
//                    return
//                }
//                following = documents.compactMap { try? $0.data(as: User.self)}
//            }
//        return following
//    }
}
