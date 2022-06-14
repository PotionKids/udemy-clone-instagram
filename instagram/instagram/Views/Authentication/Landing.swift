//
//  Landing.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/11/22.
//

import SwiftUI

struct Landing: View {
    @Binding var showing: LandingScreen
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.white.ignoresSafeArea()
            VStack {
                Labels.landingLogo
                createAccountButton
                loginButton
            }
            .padding(.horizontal)
            .offset(y: -screen.height / 17)
        }
    }
    
    var createAccountButton: some View {
        Button {
            showing = .signup
        } label: {
            Labels.landingCreateAccountLabel
        }
        .buttonStyle(PlainButtonStyle())
    }
    var loginButton: some View {
        Button {
            showing = .login
        } label: {
            Text("Log in")
                .font(.body.weight(.semibold))
        }
        .padding(.vertical)
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing(showing: .constant(.landing))
    }
}
