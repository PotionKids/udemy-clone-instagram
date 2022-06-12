//
//  Landing.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/11/22.
//

import SwiftUI

struct Landing: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                Color.white.ignoresSafeArea()
                VStack {
                    Labels.landingLogo
                    createAccountButton
                    loginButton
                }
                .padding(.horizontal)
                .offset(y: -screen.height / 10)
            }
        }
    }
    
    var createAccountButton: some View {
        Button {
            //
        } label: {
            Labels.landingCreateAccountLabel
        }
        .buttonStyle(PlainButtonStyle())

    }
    var loginButton: some View {
        Button {
            //
        } label: {
            Text("Log in")
                .font(.title3.weight(.semibold))
        }
        .padding(.vertical)
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
