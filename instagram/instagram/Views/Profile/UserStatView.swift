//
//  UserStatView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

enum Stat: String, CaseIterable {
    case posts = "Posts"
    case followers = "Followers"
    case following = "Following"
}

struct UserStatView: View {
    var stat: Stat = .posts
    var count = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text(count).font(.title3.weight(.semibold))
            Text(stat.rawValue)
        }
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView()
    }
}
