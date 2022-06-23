//
//  FeedCell.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct FeedCellExample: View {
    var user: UserExample
    var post: PostExample
    @State private var liked: Bool = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                poster
                content
                responseButtons
                likes
                description
                timeElapsed
            }
        }
    }
    
    var timeElapsed: some View {
        Labels.postTimePassedLabelExample(for: user, andPost: post)
    }
    var description: some View {
        Labels.postDescriptionLabelExample(for: user, andPost: post)
            .padding(.bottom)
    }
    var content: some View {
        Labels.postContentLabelExample(for: post)
    }
    var poster: some View {
        Labels.posterLabelExample(for: user)
            .padding([.bottom, .horizontal], screen.width / 25)
            .padding(.top, screen.width / 39)
    }
    var likes: some View {
        HStack {
            Text("1.2M Likes")
                .font(.system(size: 18, weight: .semibold))
                .padding([.top])
        }
        .padding(.horizontal, screen.width / 25)
    }
    var responseButtons: some View {
        HStack(spacing: screen.width / 20) {
            likeButton
            commentButton
            shareButton
            Spacer()
        }
        .font(.system(size: 26))
        .foregroundColor(.black)
        .padding([.top, .horizontal], screen.width / 25)
    }
    var likeButton: some View {
        Button {
            liked = true
        } label: {
            if post.isLiked {
                HStack {Labels.like}
            } else {
                HStack{Labels.unlike}
            }
        }
    }
    var commentButton: some View {
        Button {
            //
        } label: {
            Labels.comment
        }
    }
    var shareButton: some View {
        Button {
            //
        } label: {
            Labels.share
        }
    }
}
