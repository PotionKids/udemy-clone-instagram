//
//  UserListView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        LazyVStack(spacing: screen.minDim / 30) {
            ForEach(0..<10) { _ in
                NavigationLink {
                    FeedView()
                } label: {
                    UserCell(user: Users.obama)
                        .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
