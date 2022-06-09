//
//  UserListView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct UserListView: View {
    var users: [User] = Users.all
    var body: some View {
        LazyVStack(spacing: screen.minDim / 30) {
            ForEach(users) { user in
                NavigationLink {
                    FeedView()
                } label: {
                    UserCell(user: user)
                        .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
