//
//  Constants.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI
import Foundation

struct Constants {
    static let screen = UIScreen.main.bounds
    static let screenWidth = screen.width
    static let screenHeight = screen.height
    
    static let instaBlue = Color(red: 81 / 255, green: 91 / 255, blue: 212 / 255)
    static let instaPurple = Color(red: 129 / 255, green: 52 / 255, blue: 175 / 255)
    static let instaPink = Color(red: 221 / 255, green: 42 / 255, blue: 123 / 255)
    static let instaYellow = Color(red: 254 / 255, green: 218 / 255, blue: 119 / 255)
    static let instaOrange = Color(red: 245 / 255, green: 133 / 255, blue: 41 / 255)
    static let instaColors = [
                                        instaBlue,
                                        instaPurple,
                                        instaPink,
                                        instaYellow,
                                        instaOrange
                             ]
    static let instaColorsGradient = [
                                        instaPurple,
                                        instaPink,
                                        instaYellow,
                                        instaOrange,
                                        instaYellow,
                                        instaPink,
                                        instaPurple
                                     ]
    
//    #515BD4 - rgb(81, 91, 212)    Blue
//
//    #8134AF - rgb(129, 52, 175)   Purple
//
//    #DD2A7B - rgb(221, 42, 123)   Pink
//
//    #FEDA77 - rgb(254, 218, 119)  Yellow
//
//    #F58529 - rgb(245, 133, 41)   Orange
}
