//
//  ViewModifiers.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI
import Foundation

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
            .frame(width: Constants.screen.width / 1.1, height: Constants.screen.minDim / 13, alignment: .center)
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

struct StoryThumbnail: ViewModifier {
    func body(content: Content) -> some View {
        content
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
}
