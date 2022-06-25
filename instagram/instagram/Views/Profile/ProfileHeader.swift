//
//  ProfileHeader.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct ProfileHeader: View {
//    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var viewModel: ProfileViewModelAsyncAwait
    
    var body: some View {
        HStack {
            Labels.profileImage(for: viewModel.user)
            Spacer()
            UserStatView(stat: .posts, count: viewModel.user.postCount)
            Spacer()
            UserStatView(stat: .followers, count: viewModel.user.followers)
            Spacer()
            UserStatView(stat: .following, count: viewModel.user.following)
        }
    }
}
