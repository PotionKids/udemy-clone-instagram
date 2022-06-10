//
//  Stories.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct Stories: View {
    var user = Users.galGadot
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(user.stories) { story in
                    StoryView(post: story)
                }
            }
        }
        .frame(maxWidth: screen.width, maxHeight: screen.minDim / 3.5)
        .profileBottomPaddify()
    }
}

struct Stories_Previews: PreviewProvider {
    static var previews: some View {
        Stories()
    }
}
