//
//  FeedView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct FeedView: View {
    var users = Users.all
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users.shuffled()) { user in
                    ForEach(user.posts.shuffled()) { post in
                            FeedCell(user: user, post: post)
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
