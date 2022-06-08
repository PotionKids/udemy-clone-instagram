//
//  FeedCell.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct FeedCell: View {
    var post: Post
    @State private var liked: Bool = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Labels.posterLabel(for: post.poster)
                    .padding(.all, screen.width / 25)
                Labels.postContentLabel(for: post)
                HStack(spacing: screen.width / 20) {
                    Button {
                        liked = true
                    } label: {
                        Labels.unlike
                    }
                    Button {
                        //
                    } label: {
                        Labels.comment
                    }
                    Button {
                        //
                    } label: {
                        Labels.share
                    }
                    Spacer()
                }
                .font(.system(size: 26))
                .foregroundColor(.black)
                .padding(.all, screen.width / 25)
                HStack {
                    Text("0 Likes")
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                }
                .padding(.horizontal, screen.width / 25)
                Text("**\(post.poster.name)** \(post.description)")
                    .font(.system(size: 18))
                    .padding([.top, .leading, .trailing], screen.width / 25)
                Text("2d")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing, .bottom], screen.width / 25)
            }
        }
    }
}



struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Posts.rockPost5)
    }
}
