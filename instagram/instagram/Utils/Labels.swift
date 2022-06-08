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
    case search = "magnifyingglass"
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
    
    static let search: some View = image(for: .search)
    
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
    
    static func profilePic(for user: User, withScaling scaling: CGFloat) -> some View {
        Image(user.name)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: screen.minDim / scaling, height: screen.minDim / scaling)
    }
    
    static func posterProfilePic(for user: User) -> some View {
        profilePic(for: user, withScaling: 8)
    }
    
    static func userCellProfilePic(for user: User) -> some View {
        profilePic(for: user, withScaling: 10)
    }
    
    static func imageLabel(for name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFill()
            .clipped()
    }
    
    static func postContentLabel(for post: Post) -> some View {
        imageLabel(for: post.image)
            .frame(maxWidth: screen.width)
    }
    
    static func postGridLabel(for post: Post, withScaling scaling: CGFloat) -> some View {
        let width = min(screen.width, screen.height)
        return imageLabel(for: post.image)
            .frame(width: width / scaling, height: width / scaling)
    }
}
