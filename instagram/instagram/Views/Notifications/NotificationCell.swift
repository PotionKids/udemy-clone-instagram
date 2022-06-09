//
//  NotificationCell.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/9/22.
//

import SwiftUI

struct NotificationCell: View {
    var user: User
    var post: Post
    var isFollowed: Bool
    @State private var showPostImage: Bool = true
    var body: some View {
        HStack(spacing: screen.minDim / 20) {
            Labels.notificationProfilePic(for: user)
            Text(user.name).font(.system(size: 16).weight(.semibold))
            +
            Text(" started following you").font(.subheadline)
            Spacer()
            if showPostImage {
                Labels.notificationPostImage(for: post)
            } else {
                Labels.followButtonLabel(if: isFollowed)
            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell(user: Users.obama, post: Posts.rockPost3, isFollowed: false)
    }
}
