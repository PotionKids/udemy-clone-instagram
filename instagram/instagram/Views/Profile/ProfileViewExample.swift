//
//  ProfileView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct ProfileViewExample: View {
    var user = UsersExample.galGadot
    @State private var isCurrentUser = false
    @State private var isFollowedByCurrentUser = false
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    ProfileHeaderExample(user: user)
                    userFullNameExample(for: user)
                    bio(for: user)
                    followedByExample(user: user)
                    ProfileButtons(isFollowedByCurrentUser: $isFollowedByCurrentUser, isCurrentUser: $isCurrentUser)
                    StoriesExample(user: user)
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
    
    func followedByExample(user: UserExample) -> some View {
        Text("Followed by **therock**, **sushmitasen47** and **275 others**").font(.subheadline)
    }
    func bio(for user: UserExample) -> some View {
        Text(user.bio)
    }
    func userFullNameExample(for user: UserExample) -> some View {
        HStack {
            Text(user.fullname).font(.body.weight(.semibold))
                .frame(width: screen.minDim / 4.3, alignment: .leading)
            Spacer()
        }
    }
    
    
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileViewExample()
//    }
//}
