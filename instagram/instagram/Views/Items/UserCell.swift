//
//  UserCell.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct UserCell: View {
    var user: UserExample
    var body: some View {
        HStack {
                Labels.userCellLabel(for: user)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: UsersExample.obama)
    }
}
