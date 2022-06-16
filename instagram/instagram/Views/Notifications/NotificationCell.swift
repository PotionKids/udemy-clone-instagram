//
//  NotificationCell.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/9/22.
//

import SwiftUI

struct NotificationCell: View {
    var user: UserExample
    var post: PostExample
    var isFollowed: Bool
    @State private var showPostImage: Bool = true
    var body: some View {
        HStack(spacing: screen.minDim / 20) {
            Labels.notificationProfilePicExample(for: user)
            Text(user.name).font(.system(size: 16).weight(.semibold))
            +
            Text(" started following you").font(.subheadline)
            Spacer()
            if showPostImage {
                Labels.notificationPostImageExample(for: post)
            } else {
                Labels.followButtonLabel(if: isFollowed)
            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell(user: UsersExample.obama, post: PostsExample.rockPost3, isFollowed: false)
    }
}
