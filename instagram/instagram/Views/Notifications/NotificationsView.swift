//
//  NotificationsView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(UsersExample.all) { user in
                    NotificationCell(user: user, post: user.posts[0], isFollowed: true)
                }
            }
            .padding(.vertical)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
