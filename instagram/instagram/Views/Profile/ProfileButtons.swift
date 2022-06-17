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
                Button {
                    
                } label: {
                    Labels.profileEditButtonLabel
                }
            }
            else {
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
        }
        .profileBottomPaddify()
    }
    
    var followingButton: some View {
        Button {
            isFollowedByCurrentUser = false
        } label: {
//            HStack{
//                Text("Following")
//                Image(systemName: "chevron.down")
//                .font(.caption.weight(.regular))
//            }
//            .foregroundColor(.white)
//            .halfBlueButtonify()
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

//struct ProfileButtons_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileButtons(isFollowedByCurrentUser: .constant(true), isCurrentUser: .constant(true))
//    }
//}
