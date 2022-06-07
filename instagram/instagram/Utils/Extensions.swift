//
//  Extensions.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI
import Foundation

extension View {
    var screen: CGRect {
        UIScreen.main.bounds
    }
    var screenWidth: CGFloat {
        screen.width
    }
    var screenHeight: CGFloat {
        screen.height
    }
}
