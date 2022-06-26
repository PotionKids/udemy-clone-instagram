//
//  FeedView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/23/22.
//

import SwiftUI

struct FeedView: View {
//    @ObservedObject var viewModel = FeedViewModel()
    @ObservedObject var viewModel = FeedViewModelAsyncAwait()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.userPostPairs.shuffled()) { userPost in
                    FeedCell(user: userPost.user, post: userPost.post)
                }
            }
        }
    }
}
