//
//  ProfileViewModelAsyncAwait.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/25/22.
//

import Foundation

class ProfileViewModelAsyncAwait: ObservableObject {
    @Published var user: User
    
    
    var current: User? {
        AuthViewModel.shared.user
    }
    
    init(user: User) {
        self.user = user
        checkIfFollowed()
    }
    
    func follow() {
        guard let currentUID = current?.id, let followedUID = user.id else { return }
        
        Task {
            try await UserServiceAsyncAwait.follow(followedUID, by: currentUID)
        }
        
        self.user.isFollowed = true
    }
    
    func unfollow() {
        guard let currentUID = current?.id, let followedUID = user.id else { return }
        
        Task {
            try await UserServiceAsyncAwait.unfollow(followedUID, by: currentUID)
        }

        self.user.isFollowed = false
    }
    
    func checkIfFollowed() {
        guard !user.isCurrent else { return }
        guard let currentUID = current?.id, let followedUID = user.id else { return }
        
        Task {
            self.user.isFollowed = try await UserServiceAsyncAwait.checkIfFollowed(followedUID, by: currentUID)
        }
    }
}
