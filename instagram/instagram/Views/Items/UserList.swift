//
//  UserList.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct UserList: View {
    @ObservedObject var viewModel: SearchViewModel
    var body: some View {
        LazyVStack(spacing: screen.minDim / 30) {
            ForEach(viewModel.users) { user in
                NavigationLink {
                    FeedView()
                } label: {
                    UserCell(user: user)
                        .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

//struct UserList_Previews: PreviewProvider {
//    static var previews: some View {
//        UserList()
//    }
//}
