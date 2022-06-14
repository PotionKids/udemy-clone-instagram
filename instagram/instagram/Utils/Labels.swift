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
    case chevronDown = "chevron.down"
    
    case eyeOpen = "eye"
    case eyeClosed = "eye.slash"
    case person = "person"
    case personInACircle = "person.circle"
}

enum LabelErrors: Error {
    case imageNotFound(description: String)
    case videoNotFound(description: String)
    case contentNotFound(description: String)
}

struct Labels {
    static let screen = UIScreen.main.bounds
    
    static let unlike: some View = image(for: .unlike)
    static let like: some View = image(for: .like, with: .red)
    static let comment: some View = image(for: .comment).rotation3DEffect(Angle.degrees(180), axis: (x: 0, y: 1, z: 0))
    static let share: some View = image(for: .share)
    static let verified: some View = image(for: .verified)
    static let verifiedBlue: some View = image(for: .verified, with: .blue)
    
    static let passwordVisible: some View = image(for: .eyeOpen)
    static let passwordInvisible: some View = image(for: .eyeClosed)
    
    static let userNameLabelFont: Font = Font.headline.weight(.semibold)
    static let search: some View = image(for: .search)
    static let profileFollowButtonLabel: some View = Text("Follow")
                                                        .foregroundColor(.white)
                                                        .halfBlueButtonify()
    static let profileFollowingLabel: some View = HStack{
                                                    Text("Following")
                                                    image(for: .chevronDown)
                                                        .font(.caption.weight(.regular))
                                                }
    static let profileFollowingButtonLabel: some View = profileFollowingLabel
                                                        .halfBlueButtonify()
    
    static let profileMessageButtonLabel: some View = Text("Message")
                                                        .profileHalfButtonify()
                                                        .blackAndWhiteButtonify()
    
    static let profileEditButtonLabel: some View = Text("Edit Profile")
                                                        .fullBlackAndWhiteButtonify()

    static let landingLogo: some View = Image("Instagram Login Logo Font I")
                                                        .fitToAspectRatio(3.5, backgroundColor: .clear)
                                                        .scale(by: 2.5)
                                                        .offset(y: screen.height / 50)
    
    static let landingCreateAccountLabel: some View = Text("Create new account")
                                                        .font(.title3.weight(.semibold))
                                                        .foregroundColor(.white)
                                                        .fullBlueButtonify(height: .height(scaling: 25, tolerance: 0.1))
    
    static func image(for label: LabelType) -> some View {
        image(for: label, with: .black)
    }
    
    static func image(for label: LabelType, with color: Color) -> some View {
        Image(systemName: label.rawValue).foregroundColor(color)
    }
    
    static func userNameLabel(for user: User) -> some View {
        userNameLabel(for: user, with: userNameLabelFont)
    }
    
    static func userNameLabel(for user: User, with font: Font) -> some View {
        HStack {
            Text(user.name)
            if user.isVerified {
                image(for: .verified, with: .blue)
            }
        }
        .font(font.weight(.semibold))
    }
    
    static func userFullNameLabel(for user: User) -> some View {
        Text(user.fullname)
    }
    
    static func posterLabel(for user: User) -> some View {
        HStack(alignment: .center, spacing: screen.width / 50) {
            posterProfilePic(for: user)
            userNameLabel(for: user)
            Text("44*m*").font(.body.weight(.thin))
            Spacer()
        }
    }
    
    static func postDescriptionLabel(for user: User, andPost post: Post) -> some View {
        Text("**\(user.name)** \(post.description)")
            .font(.system(size: 18, weight: .regular))
            .padding([.top, .leading, .trailing], screen.width / 25)
    }
    
    static func postTimePassedLabel(for user: User, andPost post: Post) -> some View {
        Text("2d")
            .font(.system(size: 17))
            .foregroundColor(.gray)
            .padding([.leading, .trailing, .bottom], screen.width / 25)
    }
    
    
    static func profilePic(for user: User, withScaling scaling: CGFloat) -> some View {
        Image(user.image)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: screen.minDim / scaling, height: screen.minDim / scaling)
    }
    
    static func posterProfilePic(for user: User) -> some View {
        profilePic(for: user, withScaling: 8)
    }
    
    static func notificationProfilePic(for user: User) -> some View {
        profilePic(for: user, withScaling: 12)
    }
    
    static func userCellLabel(for user: User) -> some View {
        HStack {
            userCellProfilePic(for: user)
            VStack(alignment: .leading, spacing: screen.minDim / 75) {
                userNameLabel(for: user)
                userFullNameLabel(for: user)
            }
            Spacer()
        }
        .foregroundColor(.black)
    }
    
    static func userCellProfilePic(for user: User) -> some View {
        profilePic(for: user, withScaling: 8)
    }
    
    static func imageLabel(for name: String) -> some View {
        Image(name)
            .fitToAspectRatio(1)
    }
    
    static func squareImageLabel(for name: String, withScaling scaling: CGFloat) -> some View {
        Image(name)
            .fitToAspectRatio(1)
            .padding(.all, Constants.screen.minDim / 200)
            .scale(by: scaling)
    }
    
    static func postContentLabel(for post: Post) -> some View {
        imageLabel(for: post.image)
            .frame(maxWidth: screen.width)
    }
    
    static func postGridLabel(for post: Post, withScaling scaling: CGFloat) -> some View {
        return squareImageLabel(for: post.image, withScaling: 3)
    }
    
    static func followButtonLabel(if isFollowed: Bool) -> some View {
        let height = screen.minDim / 20
        return Text(isFollowed ? "Following" : "Follow")
            .font(.subheadline)
            .padding()
            .frame(height: height, alignment: .center)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(height / 2)
    }
    
    static func notificationPostImage(for post: Post) -> some View {
        imageLabel(for: post.image)
            .scale(by: 10)
    }
    
    static func profileImage(for user: User, hasStory: Bool = true) -> some View {
        ZStack(alignment: .center) {
            profilePic(for: user, withScaling: 4.3)
            if hasStory {
                Circle()
                    .strokeBorder(
                        AngularGradient(gradient: Gradient(colors: Constants.instaColorsGradient), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: screen.minDim / 130
                    )
                    .scale(by: 3.85)
            }
        }
    }
    
    static func profileStoryThumbnail(for post: Post) -> some View {
        ZStack(alignment: .center) {
            Image(post.image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .scale(by: 6)
            Circle()
                .strokeBorder(lineWidth: 1)
                .frame(width: Constants.screen.width / 5.5, height: Constants.screen.width / 5.5, alignment: .center)
                .foregroundColor(.gray.opacity(0.6))
        }
    }
}
