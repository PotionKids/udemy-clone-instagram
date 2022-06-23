//
//  UserListViewExample.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct UserListViewExample: View {
    @ObservedObject var viewModel: SearchViewModel
    var users: [UserExample] = UsersExample.all
    var body: some View {
        LazyVStack(spacing: screen.minDim / 30) {
            ForEach(users) { user in
                NavigationLink {
                    FeedViewExample()
                } label: {
                    UserCellExample(user: user)
                        .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
