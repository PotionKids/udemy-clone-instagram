//
//  ProfileView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct ProfileView: View {
    var user = Users.galGadot
    @State private var isCurrentUser = true
    @State private var isFollowedByCurrentUser = false
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    ProfileHeader(user: user)
                    userFullName(for: user)
                    bio(for: user)
                    followedBy(user: user)
                    ProfileButtons(isFollowedByCurrentUser: $isFollowedByCurrentUser, isCurrentUser: $isCurrentUser)
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
    
    func followedBy(user: User) -> some View {
        Text("Followed by **therock**, **sushmitasen47** and **275 others**").font(.subheadline)
    }
    func bio(for user: User) -> some View {
        Text(user.bio)
    }
    func userFullName(for user: User) -> some View {
        HStack {
            Text(user.fullname).font(.body.weight(.semibold))
                .frame(width: screen.minDim / 4.3, alignment: .leading)
            Spacer()
        }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
