//
//  ProfileViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/18/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        print("DEBUG: Follow...")
    }
    
    func unfollow() {
        print("DEBUG: Unfollow...")
    }
    
    func checkIfFollowed() {
        
    }
}
