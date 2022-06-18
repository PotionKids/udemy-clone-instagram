//
//  ProfileViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/18/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    let user: User
    var current: User? {
        AuthViewModel.shared.user
    }
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard   let current = current,
                let currentUID = current.id,
                let followingUID = user.id else { return }
        UserService.follow(currentUID: currentUID, followingUID: followingUID) { _ in
            print("DEBUG: SUCCESS: Current User: \(current.username) Successfully followed \(self.user.username)")
        }
    }
    
    func unfollow() {
        print("DEBUG: Unfollow...")
    }
    
    func checkIfFollowed() {
        
    }
}
