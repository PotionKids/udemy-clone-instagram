//
//  Login.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/11/22.
//

import SwiftUI

struct Login: View {
    @State var login: String
    @State var password: String
    var body: some View {
        VStack {
            Labels.landingLogo
            loginTextField
            passwordTextField
        }
    }
    var loginTextField: some View {
        TextField("Phone number, email or username", text: $login)
            .textFieldify(withHeightScaling: 25)
            .padding(.horizontal)
    }
    var passwordTextField: some View {
        TextField("Password", text: $password)
            .textFieldify(withHeightScaling: 25)
            .padding(.horizontal)
            .overlay {
                HStack {
                    Labels.search
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .padding(.leading, Constants.screen.width / 50)
                        .opacity(0.2)
                }
            }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(login: "", password: "")
    }
}
