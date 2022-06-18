//
//  UserService.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/18/22.
//

import Foundation
import Firebase

struct UserService {
    
    static func follow(currentUID: String, followingUID: String, completion: ((Error?) -> Void)?) {
        Constants.collectionFollowing
            .document(currentUID)
            .collection(Constants.userFollowing)
            .document(followingUID).setData([:]) { _ in
                Constants.collectionFollowers
                    .document(followingUID).collection(Constants.userFollowers)
                    .document(currentUID).setData([:], completion: completion)
            }
    }
    
    static func unfollow() {
        print("DEBUG: Unfollow...")
    }
    
    static func checkIfFollowed() {
        
    }
}
