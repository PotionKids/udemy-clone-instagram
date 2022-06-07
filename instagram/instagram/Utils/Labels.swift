//
//  ButtonLabels.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI
import Foundation

enum LabelType: String, CaseIterable {
    case like = "heart.fill"
    case unlike = "heart"
    case comment = "bubble.right"
    case share = "paperplane"
    case verified = "checkmark.seal.fill"
}

enum LabelErrors: Error {
    case imageNotFound(description: String)
    case videoNotFound(description: String)
    case contentNotFound(description: String)
}

struct Labels {
    static let screen = UIScreen.main.bounds
    
    static let unlike: some View = image(for: .unlike)
    static let like: some View = image(for: .like)
    static let comment: some View = image(for: .comment).rotation3DEffect(Angle.degrees(180), axis: (x: 0, y: 1, z: 0))
    static let share: some View = image(for: .share)
    static let verified: some View = image(for: .verified)
    static let verifiedBlue: some View = verified.foregroundColor(.blue)
    
    static func image(for label: LabelType) -> some View {
        Image(systemName: label.rawValue)
    }
    
    static func posterLabel(for user: User) -> some View {
        HStack(alignment: .center, spacing: screen.width / 50) {
            Labels.posterProfilePic(for: user)
            Text(user.name)
                .font(.headline.weight(.medium))
            Labels.verifiedBlue
            Text("44m")
            Spacer()
        }
    }
    
    static func posterProfilePic(for user: User) -> some View {
        Image(user.profilePicFileName)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: screen.width / 8, height: screen.width / 8)
    }
    
    static func postContentLabel(for post: Post) -> some View {
        Image(post.image)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: screen.width)
            .clipped()
    }
}
