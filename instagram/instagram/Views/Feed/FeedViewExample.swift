//
//  FeedView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct FeedViewExample: View {
    @ObservedObject var viewModel = FeedViewModel()
    var users = UsersExample.all
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users.shuffled()) { user in
                    ForEach(user.posts.shuffled()) { post in
                            FeedCellExample(user: user, post: post)
                            .onTapGesture {
                                viewModel.fetchFeed()
                            }
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedViewExample()
    }
}
