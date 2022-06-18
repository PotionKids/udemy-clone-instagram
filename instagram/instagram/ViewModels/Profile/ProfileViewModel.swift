//
//  ProfileViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/18/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
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
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        print("DEBUG: Unfollow...")
    }
    
    func checkIfFollowed() {
        
    }
}
