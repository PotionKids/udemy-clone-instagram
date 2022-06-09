//
//  PostGridView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        LazyVGrid(columns: items, spacing: screenWidth / 200) {
            ForEach(0..<8) {_ in
                NavigationLink {
                    FeedView()
                } label: {
                    Labels.postGridLabel(for: Posts.rockPost8a, withScaling: 3)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
