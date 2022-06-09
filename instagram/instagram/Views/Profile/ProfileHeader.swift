//
//  ProfileHeader.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct ProfileHeader: View {
    var user = Users.galGadot
    
    var body: some View {
        HStack {
            Labels.profileImage(for: Users.galGadot)
            Spacer()
            UserStatView(stat: .posts, count: user.postCount)
            Spacer()
            UserStatView(stat: .followers, count: user.followers)
            Spacer()
            UserStatView(stat: .following, count: user.following)
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader()
    }
}
