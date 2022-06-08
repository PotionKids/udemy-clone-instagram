//
//  UserCell.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct UserCell: View {
    var user: User
    var body: some View {
        HStack {
            // Profile Pic
            Button {
                //
            } label: {
                Labels.userCellLabel(for: user)
            }
            .buttonStyle(PlainButtonStyle())

            VStack {
                // username
                // full name
                
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: Users.obama)
    }
}
