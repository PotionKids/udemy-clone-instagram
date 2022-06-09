//
//  ProfileButtons.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct ProfileButtons: View {
    @Binding var isFollowedByCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isFollowedByCurrentUser {
                followingButton.background(.white)
            } else {
                followButton
            }
            Spacer()
            Labels.profileMessageButtonLabel
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
}

struct ProfileButtons_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtons(isFollowedByCurrentUser: .constant(true))
    }
}
