//
//  ProfileViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/18/22.
//

import Foundation

class ProfileViewModelOld: ObservableObject {
    @Published var user: User
    var current: User? {
        AuthViewModel.shared.user
    }
    
    var currentUID: String {
        current?.id ?? ""
    }
    
    var followedUID: String {
        user.id ?? ""
    }
    
    init(user: User) {
        self.user = user
        checkIfFollowed()
    }
    
    func follow() {
        UserService.follow(followedUID, by: currentUID) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(followedUID, by: currentUID) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfFollowed() {
        guard !user.isCurrent else { return }
        UserService.checkIfFollowed(followedUID, by: currentUID) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
}
