//
//  ProfileButtons.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct ProfileButtons: View {
//    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var viewModel: ProfileViewModelAsyncAwait
    var isFollowedByCurrentUser: Bool {
        viewModel.user.isFollowed ?? false
    }
    
    var body: some View {
        HStack {
            if viewModel.user.isCurrent {
                buttonForCurrentUser
            }
            else {
                buttonsForOtherUser
            }
        }
        .profileBottomPaddify()
    }
    
    var buttonForCurrentUser: some View {
        Button {
            
        } label: {
            Labels.profileEditButtonLabel
        }
    }
    
    var buttonsForOtherUser: some View {
        HStack {
            if isFollowedByCurrentUser {
                followingButton.background(.white)
            } else {
                followButton
            }
            Spacer()
            messageButton
        }
    }
    
    var followingButton: some View {
        Button {
            viewModel.unfollow()
        } label: {
            Labels.profileFollowingButtonLabel
        }
    }
    
    var followButton: some View {
        Button {
            viewModel.follow()
        } label: {
            Labels.profileFollowButtonLabel
        }
    }
    
    var messageButton: some View {
        Button {
            //
        } label: {
            Labels.profileMessageButtonLabel
        }
    }
}
