//
//  UserCell.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct UserCell: View {
    var user: User
    var body: some View {
        HStack {
                Labels.userCellLabel(for: user)
        }
    }
}
