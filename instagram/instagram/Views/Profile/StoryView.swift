//
//  StoryView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct StoryView: View {
    var post = PostsExample.galGadotStory2
    var body: some View {
        VStack {
            Labels.profileStoryThumbnailExample(for: post)
            Text(post.storyName ?? "")
                .font(.subheadline.weight(.light))
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
