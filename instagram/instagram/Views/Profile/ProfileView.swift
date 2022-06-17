//
//  ProfileView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct ProfileView: View {
    var user: User
    @ObservedObject var viewModel: ProfileViewModel
    @State private var isFollowedByCurrentUser = false
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        return ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    ProfileHeader(viewModel: viewModel)
                    fullname
                    bio
                    followedBy
                    ProfileButtons(viewModel: viewModel, isFollowedByCurrentUser: $isFollowedByCurrentUser)
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
