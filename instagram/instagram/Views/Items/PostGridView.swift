//
//  PostGridView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct PostGridView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var userPosts: [UserPost] {
        viewModel.userPostPairs
    }
    
    private let items = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items, spacing: screen.minDim / 250) {
                ForEach(userPosts) { userPost in
                    NavigationLink {
                        FeedView()
                    } label: {
                        Labels.postGridLabel(for: userPost.post, withScaling: 3)
                    }
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
