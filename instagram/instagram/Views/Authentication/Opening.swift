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
    var body: some View {
        switch showing {
        case .login:
            Login(showing: $showing)
        case .signup:
            Signup(showing: $showing)
        case .landing:
            Landing(showing: $showing)
        }
    }
}

struct Opening_Previews: PreviewProvider {
    static var previews: some View {
        Opening()
    }
}

