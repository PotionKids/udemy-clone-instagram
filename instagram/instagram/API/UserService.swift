//
//  UserService.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/18/22.
//

import Foundation
import Firebase

struct UserService {
    
    static func follow(_ followed: String, by current: String, completion: ((Error?) -> Void)?) {
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
    
    static func unfollow(_ followed: String, by current: String, completion: ((Error?) -> Void)?) {
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
}
