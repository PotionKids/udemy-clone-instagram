//
//  FeedViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/21/22.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    var current: User? {
        AuthViewModel.shared.user
    }
    
    func fetch() {
        guard let user = current,
              let uid = user.id
        else { return }
        UserService.fetch(followingForUserID: uid) { following in
            //
        }
    }
}
