//
//  UserList.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct UserList: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        viewModel.search(query: searchText)
    }
    
    var body: some View {
        LazyVStack(spacing: screen.minDim / 30) {
            ForEach(users) { user in
                NavigationLink {
                    if let viewer = authViewModel.user {
                        ProfileView(viewer: viewer, user: user)
                    }
                } label: {
                    UserCell(user: user)
                        .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
