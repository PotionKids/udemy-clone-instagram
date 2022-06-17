//
//  ProfileView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct ProfileView: View {
    var viewer: User
    var user: User
    @State private var isFollowedByCurrentUser = false
    
    var isCurrentUser: Bool {
        viewer == user
    }
    
    var body: some View {
        return ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    ProfileHeader(user: user)
                    fullname
                    bio
                    followedBy
                    ProfileButtons(isFollowedByCurrentUser: $isFollowedByCurrentUser, isCurrentUser: isCurrentUser)
                    Stories(user: user)
                }
                .padding(.horizontal, screen.minDim / 30)
                .padding(.vertical, screen.minDim / 50)
                DisplayButtons()
                PostGridView(posts: user.posts)
                    .offset(y: 30)
                    .frame(maxWidth: screen.width)
                Spacer()
            }
        }
    }
    
    var followedBy: some View {
        Text("Followed by **therock** and **275 others**").font(.subheadline)
    }
    var bio: some View {
        Text(user.bio)
    }
    var fullname: some View {
        HStack {
            Text(user.fullname).font(.body.weight(.semibold))
                .frame(maxWidth: screen.minDim / 1.1, alignment: .leading)
            Spacer()
        }
    }
}
