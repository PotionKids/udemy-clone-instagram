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
        checkIfFollowed()
    }
    
    func follow() {
        guard   let current = current,
                let currentUID = current.id,
                let followedUID = user.id else { return }
        UserService.follow(followedUID, by: currentUID) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard   let current = current,
                let currentUID = current.id,
                let followedUID = user.id else { return }
        UserService.unfollow(followedUID, by: currentUID) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfFollowed() {
        guard !user.isCurrent else { return }
        guard   let current = current,
                let currentUID = current.id,
                let followedUID = user.id else { return }
        UserService.checkIfFollowed(followedUID, by: currentUID) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}
