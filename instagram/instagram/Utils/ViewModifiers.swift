//
//  ViewModifiers.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI
import Foundation
import Kingfisher

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
    private let backgroundColor: Color
    
    public init(_ aspectRatio: CGFloat) {
        self.aspectRatio = aspectRatio
        self.backgroundColor = .black
    }
    
    public init(_ aspectRatio: AspectRatio) {
        self.aspectRatio = aspectRatio.rawValue
        self.backgroundColor = .black
    }
    
    public init(_ aspectRatio: CGFloat, backgroundColor: Color) {
        self.aspectRatio = aspectRatio
        self.backgroundColor = backgroundColor
    }
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            Rectangle()
                .fill(backgroundColor)
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
    
    func fitToAspectRatio(_ aspectRatio: CGFloat, backgroundColor: Color) -> some View {
        self.resizable().modifier(FitToAspectRatio(aspectRatio, backgroundColor: backgroundColor))
    }
    
    func squarify() -> some View {
        self.resizable().modifier(FitToAspectRatio(1))
    }
}

public extension KFImage {
    func fitToAspectRatio(_ aspectRatio: CGFloat) -> some View {
        self.resizable().modifier(FitToAspectRatio(aspectRatio))
    }
    
    func fitToAspectRatio(_ aspectRatio: AspectRatio) -> some View {
        self.resizable().modifier(FitToAspectRatio(aspectRatio))
    }
    
    func fitToAspectRatio(_ aspectRatio: CGFloat, backgroundColor: Color) -> some View {
        self.resizable().modifier(FitToAspectRatio(aspectRatio, backgroundColor: backgroundColor))
    }
    
    func squarify() -> some View {
        self.resizable().modifier(FitToAspectRatio(1))
    }
}

extension View {
    func scale(by scaling: CGFloat) -> some View {
        self.frame(width: screen.minDim / scaling, height: screen.minDim / scaling, alignment: .center)
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
    var heightScaling: CGFloat = 30
    func body(content: Content) -> some View {
        content
            .font(.body.weight(.medium))
            .frame(minWidth: Constants.screen.width / 1.2, idealWidth: Constants.screen.width / 1.1, maxWidth: Constants.screen.width, minHeight: Constants.screen.height / heightScaling, idealHeight: Constants.screen.height / heightScaling, maxHeight: Constants.screen.height / 12, alignment: .center)
    }
}


struct Modifiers {
    enum Shape {
        case rectangle(cornerRadiusScaling: CGFloat)
        case capsule
        case circle
        
        var radius: CGFloat {
            switch self {
            case .rectangle(let cornerRadiusScaling):
                return Constants.screen.minDim / cornerRadiusScaling
            case .capsule, .circle:
                return 0
            }
        }
    }
    
    enum Line {
        case width(scaling: CGFloat)
        
        var value: CGFloat {
            switch self {
            case .width(let scaling):
                return Constants.screen.minDim / scaling
            }
        }
    }
}

struct BackgroundModifier: ViewModifier {
    var shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 100)
    var color: Color = .blue
    
    init(shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 100), color: Color = .blue) {
        self.shape = shape
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .background {
                switch shape {
                case .rectangle(let cornerRadiusScaling):
                    RoundedRectangle(cornerRadius: Constants.screen.minDim / cornerRadiusScaling)
                        .foregroundColor(color)
                case .capsule:
                    Capsule()
                        .foregroundColor(color)
                case .circle:
                    Circle()
                        .foregroundColor(color)
                }
            }
    }
}

struct BorderModifier: ViewModifier {
    var shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 100)
    var width: Modifiers.Line = .width(scaling: 450)
    var color: Color = .gray
    
    init(
            shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 100),
            width: Modifiers.Line,
            color: Color = .blue
    ) {
        self.shape = shape
        self.width = width
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .center) {
                switch shape {
                case .rectangle(_):
                    RoundedRectangle(cornerRadius: shape.radius)
                        .strokeBorder(lineWidth: width.value)
                        .foregroundColor(color)
                case .capsule:
                    Capsule()
                        .strokeBorder(lineWidth: width.value)
                        .foregroundColor(color)
                case .circle:
                    Circle()
                        .strokeBorder(lineWidth: width.value)
                        .foregroundColor(color)
                }
            }
    }
}

struct FlexFrame: ViewModifier {
    enum Level {
        case min
        case ideal
        case max
    }
    
    enum Dimension {
        case width(scaling: CGFloat, tolerance: CGFloat)
        case height(scaling: CGFloat, tolerance: CGFloat)
        
        var standard: CGFloat {
            switch self {
            case .width:
                return Constants.screen.width
            case .height:
                return Constants.screen.height
            }
        }
        
        var minDim: CGFloat {
            min(Constants.screen.width, Constants.screen.height)
        }
        
        func length(_ level: Level) -> CGFloat {
            switch level {
            case .min:
                switch self {
                case .width(let scaling, let tolerance), .height(let scaling, let tolerance):
                    return standard / (scaling * (1 + tolerance))
                }
            case .ideal:
                switch self {
                case .width(let scaling, _), .height(let scaling, _):
                    return standard / scaling
                }
            case .max:
                switch self {
                case .width(let scaling, let tolerance), .height(let scaling, let tolerance):
                    return standard / (scaling * (1 - tolerance))
                }
            }
        }
    }
    
    var width: Dimension = .width(scaling: 1.1, tolerance: 0.1)
    var height: Dimension = .height(scaling: 30, tolerance: 0.1)
    var alignment: Alignment = .center
    
    init(
        width: Dimension = .width(scaling: 1.1, tolerance: 0.1),
        height: Dimension = .height(scaling: 30, tolerance: 0.1),
        alignment: Alignment = .center
    ) {
        self.width = width
        self.height = height
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: width.length(.min),
                idealWidth: width.length(.ideal),
                maxWidth: width.length(.max),
                minHeight: height.length(.min),
                idealHeight: height.length(.ideal),
                maxHeight: height.length(.max),
                alignment: alignment
            )
    }
}

struct ViewColor {
    enum Colors {
        case background(color: Color)
        case foreground(color: Color)
        case border(color: Color)
        
        var color: Color {
            switch self {
            case .background(let color),
                 .foreground(let color),
                 .border(color: let color):
                return color
            }
        }
    }
    
    var background: Colors = .background(color: .blue)
    var foreground: Colors = .foreground(color: .white)
    var border: Colors?
    
    init(background: Color, foreground: Color, border: Color? = nil) {
        self.background = .background(color: background)
        self.foreground = .foreground(color: foreground)
        if let color = border {
            self.border = .border(color: color)
        }
    }
}

struct ColorModifier: ViewModifier {
    enum Colors {
        case background(color: Color)
        case foreground(color: Color)
        
        var color: Color {
            switch self {
            case .background(let color), .foreground(let color):
                return color
            }
        }
    }
    
    var background: Colors = .background(color: .blue)
    var foreground: Colors = .foreground(color: .white)
    
    init(background: Color, foreground: Color) {
        self.background = .background(color: background)
        self.foreground = .foreground(color: foreground)
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foreground.color)
            .background(background.color)
    }
}

struct ColorButtonBorderless: ViewModifier {
    var colors = ViewColor(background: .blue, foreground: .white)
    var cornerRadiusScaling: CGFloat = 150
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(colors.foreground.color)
            .background(
                RoundedRectangle(cornerRadius: Constants.screen.minDim / cornerRadiusScaling)
                    .foregroundColor(colors.background.color)
            )
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
    var heightScaling: CGFloat = 30
    var background: UIColor = .systemGray5
    var alignment: Alignment = .center
    func body(content: Content) -> some View {
        content
            .frame(height: Constants.screen.height / heightScaling, alignment: alignment)
            .padding(Constants.screen.width / 50)
            .background(Color(background))
            .cornerRadius(Constants.screen.width / 50)
    }
}

extension View {
    func profileHalfButtonify() -> some View {
        modifier(ProfileHalfButton())
    }
    
    func borderlessColorButtonify(background: Color = .blue, foreground: Color = .white, cornerRadiusScaling: CGFloat = 150) -> some View {
        modifier(ColorButtonBorderless(colors: ViewColor(background: background, foreground: foreground), cornerRadiusScaling: cornerRadiusScaling))
    }
    
    func blackAndWhiteButtonify() -> some View {
        modifier(BlackAndWhiteButton())
    }
    
    func redButtonify() -> some View {
        self.borderlessColorButtonify(background: .red, foreground: .white, cornerRadiusScaling: 150)
    }
    
    func blueButtonify() -> some View {
        self.borderlessColorButtonify(background: .blue, foreground: .white, cornerRadiusScaling: 150)
    }
    
    func borderlessBlueButtonify(cornerRadiusScaling: CGFloat = 150) -> some View {
        self.borderlessColorButtonify(cornerRadiusScaling: cornerRadiusScaling)
    }
    
    func profileFullButtonify() -> some View {
        modifier(ProfileFullButton())
    }
    
    func profileFullButtonify(withHeightScaling scaling: CGFloat) -> some View {
        modifier(ProfileFullButton(heightScaling: scaling))
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
    
    func textFieldify(heightScaling: CGFloat = 30, backgroundColor: UIColor = UIColor.systemGray5, alignment: Alignment = .center) -> some View {
        modifier(TextFieldModifier(heightScaling: heightScaling, background: backgroundColor, alignment: alignment))
    }
    
    func textFieldify(withHeightScaling scaling: CGFloat) -> some View {
        modifier(TextFieldModifier(heightScaling: scaling))
    }
    
    func backgroundify() -> some View {
        modifier(BackgroundModifier(shape: .rectangle(cornerRadiusScaling: 25), color: .white))
    }

    func flexFramify(
                        width: FlexFrame.Dimension = .width(scaling: 1.1, tolerance: 0.1) ,
                        height: FlexFrame.Dimension = .height(scaling: 30, tolerance: 0.1),
                        alignment: Alignment = .center
    ) -> some View {
        modifier(FlexFrame(width: width, height: height, alignment: alignment))
    }
    
    func backgroundify(
                        shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 150),
                        color: Color = .blue
    ) -> some View {
        modifier(BackgroundModifier(shape: shape, color: color))
    }
    
    func borderify(
                        shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 150),
                        width: Modifiers.Line = .width(scaling: 450),
                        color: Color = .gray
    ) -> some View {
        modifier(BorderModifier(shape: shape, width: width, color: color))
    }
    
    func fullButtonify(
        height: FlexFrame.Dimension = .height(scaling: 30, tolerance: 0.1)
    ) -> some View {
        self.flexFramify(
                    width: .width(scaling: 1.1, tolerance: 0.1),
                    height: height,
                    alignment: .center
        )
    }
    
    func fullBlueButtonify(
                        height: FlexFrame.Dimension = .height(scaling: 30, tolerance: 0.1),
                        shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 150)
    ) -> some View {
        self
            .fullButtonify(height: height)
            .backgroundify(shape: shape, color: .blue)
    }
    
    func fullBlackAndWhiteButtonify(
        height: FlexFrame.Dimension = .height(scaling: 30, tolerance: 0.1),
        shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 150),
        lineWidth: Modifiers.Line = .width(scaling: 450)
    ) -> some View {
        self
            .fullButtonify(height: height)
            .backgroundify(shape: shape, color: .white)
            .borderify(shape: shape, width: lineWidth, color: .gray)
    }
    
    func halfButtonify(
        height: FlexFrame.Dimension = .height(scaling: 30, tolerance: 0.1)
    ) -> some View {
        self.flexFramify(
                    width: .width(scaling: 2.2, tolerance: 0.1),
                    height: height,
                    alignment: .center
        )
    }
    
    func halfBlueButtonify(
        height: FlexFrame.Dimension = .height(scaling: 30, tolerance: 0.1),
        shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 150)
    ) -> some View {
        self
            .halfButtonify(height: height)
            .backgroundify(shape: shape, color: .blue)
    }
    
    func halfBlackAndWhiteButtonify(
        height: FlexFrame.Dimension = .height(scaling: 30, tolerance: 0.1),
        shape: Modifiers.Shape = .rectangle(cornerRadiusScaling: 150),
        lineWidth: Modifiers.Line = .width(scaling: 450)
    ) -> some View {
        self
            .halfButtonify(height: height)
            .backgroundify(shape: shape, color: .white)
            .borderify(shape: shape, width: lineWidth, color: .gray)
    }
}
