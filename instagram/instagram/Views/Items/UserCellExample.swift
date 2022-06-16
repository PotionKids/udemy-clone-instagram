//
//  UserCellExample.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct UserCellExample: View {
    var user: UserExample
    var body: some View {
        HStack {
                Labels.userCellLabelExample(for: user)
        }
    }
}

struct UserCellExample_Previews: PreviewProvider {
    static var previews: some View {
        UserCellExample(user: UsersExample.obama)
    }
}
