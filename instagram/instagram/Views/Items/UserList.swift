//
//  UserList.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct UserList: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        searchViewModel.search(query: searchText)
    }
    
    var body: some View {
        LazyVStack(spacing: screen.minDim / 30) {
            ForEach(users) { user in
                NavigationLink {
                    ProfileView(user: user)
                } label: {
                    UserCell(user: user)
                        .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
