//
//  ProfileButtons.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct ProfileButtons: View {
    @Binding var isFollowedByCurrentUser: Bool
    var isCurrentUser: Bool
    var body: some View {
        HStack {
            if isCurrentUser {
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
            isFollowedByCurrentUser = false
        } label: {
            Labels.profileFollowingButtonLabel
        }
    }
    
    var followButton: some View {
        Button {
            isFollowedByCurrentUser = true
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
