//
//  Opening.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/14/22.
//

import SwiftUI

enum LandingScreen {
    case login
    case signup
    case landing
}

struct Opening: View {
    @State private var showing: LandingScreen = .landing
    @Binding var selected: Tab
    
    var body: some View {
        switch showing {
        case .login:
            Login(showing: $showing, selected: $selected)
        case .signup:
            Signup(showing: $showing, selected: $selected)
        case .landing:
            Landing(showing: $showing)
        }
    }
}

