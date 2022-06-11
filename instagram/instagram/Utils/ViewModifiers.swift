//
//  ViewModifiers.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI
import Foundation

/// Common aspect ratios
public enum AspectRatio: CGFloat {
    case square = 1
    case threeToFour = 0.75
    case fourToThree = 1.75
}

public enum AspectRatioCustom {
    case custom(ratio: CGFloat, actual: CGFloat)
}

/// Fit an image to a certain aspect ratio while maintaining its aspect ratio
public struct FitToAspectRatio: ViewModifier {
    
    private let aspectRatio: CGFloat
    
    public init(_ aspectRatio: CGFloat) {
        self.aspectRatio = aspectRatio
    }
    
    public init(_ aspectRatio: AspectRatio) {
        self.aspectRatio = aspectRatio.rawValue
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color(.black))
                .aspectRatio(aspectRatio, contentMode: .fit)
            
            content
                .scaledToFill()
                .layoutPriority(-1)
        }
        .clipped()
    }
}

// Image extension that composes with the `.resizable()` modifier
public extension Image {
    func fitToAspectRatio(_ aspectRatio: CGFloat) -> some View {
        self.resizable().modifier(FitToAspectRatio(aspectRatio))
    }
    
    func fitToAspectRatio(_ aspectRatio: AspectRatio) -> some View {
        self.resizable().modifier(FitToAspectRatio(aspectRatio))
    }
}


struct ProfileHalfButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body.weight(.medium))
            .frame(width: Constants.screen.width / 2.2, height: Constants.screen.minDim / 13, alignment: .center)
            .cornerRadius(Constants.screen.minDim / 150)
    }
}

struct ProfileFullButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body.weight(.medium))
            .frame(minWidth: Constants.screen.width / 1.2, idealWidth: Constants.screen.width / 1.1, maxWidth: Constants.screen.width, minHeight: Constants.screen.minDim / 13, idealHeight: Constants.screen.minDim / 13, maxHeight: Constants.screen.minDim / 12, alignment: .center)
    }
}

struct BlackAndWhiteButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray))
    }
}

struct BlueButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .foregroundColor(.blue)
            )
    }
}

struct ProfileBottomPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.bottom, Constants.screen.minDim / 150)
    }
}

struct StoryThumbnail: ViewModifier {
    typealias Image = Content
    func body(content: Image) -> some View {
        content
    }
}

struct ImageGrid: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

struct SearchBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(Constants.screen.width / 50)
            .padding(.horizontal, Constants.screen.width / 16)
            .background(Color(.systemGray5))
            .cornerRadius(Constants.screen.width / 50)
            .overlay {
                HStack {
                    Labels.search
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, Constants.screen.width / 50)
                        .opacity(0.2)
                }
            }
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(Constants.screen.width / 50)
//            .padding(.horizontal, Constants.screen.width / 16)
            .background(Color(.systemGray5))
            .cornerRadius(Constants.screen.width / 50)
    }
}

extension View {
    func profileHalfButtonify() -> some View {
        modifier(ProfileHalfButton())
    }
    
    func blackAndWhiteButtonify() -> some View {
        modifier(BlackAndWhiteButton())
    }
    
    func blueButtonify() -> some View {
        modifier(BlueButton())
    }
    
    func profileFullButtonify() -> some View {
        modifier(ProfileFullButton())
    }
    
    func storyThumbnailify() -> some View {
        modifier(StoryThumbnail())
    }
    
    func profileBottomPaddify() -> some View {
        modifier(ProfileBottomPadding())
    }
    
    func searchBarify() -> some View {
        modifier(SearchBarModifier())
    }
    
    func textFieldify() -> some View {
        modifier(TextFieldModifier())
    }
}
