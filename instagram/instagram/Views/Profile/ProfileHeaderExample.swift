//
//  ProfileHeader.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct ProfileHeaderExample: View {
    var user = UsersExample.galGadot
    
    var body: some View {
        HStack {
            Labels.profileImageExample(for: UsersExample.galGadot)
            Spacer()
            UserStatView(stat: .posts, count: user.postCount)
            Spacer()
            UserStatView(stat: .followers, count: user.followers)
            Spacer()
            UserStatView(stat: .following, count: user.following)
        }
    }
}
