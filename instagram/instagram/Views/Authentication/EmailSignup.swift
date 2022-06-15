//
//  EmailSignup.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/14/22.
//

import SwiftUI

struct EmailSignup: View {
    @State private var isSecured: Bool = true
    @Binding var username: String
    @Binding var fullname: String
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            usernameTextField
            fullnameTextField
            emailTextField
            passwordTextField
        }
    }
    
    var usernameTextField: some View {
        TextField("Username", text: $username)
            .font(.title3)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
        .textFieldify(withHeightScaling: 25)
    }
    var fullnameTextField: some View {
        TextField("Fullname", text: $fullname)
            .font(.title3)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
        .textFieldify(withHeightScaling: 25)
    }
    var emailTextField: some View {
        TextField("Email", text: $email)
            .font(.title3)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
        .textFieldify(withHeightScaling: 25)
    }
    var passwordTextField: some View {
        Group {
            if isSecured {
                SecureField("Password", text: $password)
            } else {
                TextField("Password", text: $password)
            }
        }
        .textFieldify(withHeightScaling: 25)
        .overlay(alignment: .trailing) {
            HStack {
                Button {
                    isSecured.toggle()
                } label: {
                    passwordVisibilityLabel()
                        .offset(x: -screen.minDim / 60)
                }
            }
        }
    }
    
    @ViewBuilder
    func passwordVisibilityLabel() -> some View {
        if isSecured {
            Image(systemName: "eye.slash")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(Color(UIColor.systemGray2))
        } else {
            Image(systemName: "eye")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.blue)
        }
    }
}

struct EmailSignup_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignup(
            username: .constant(""),
            fullname: .constant(""),
            email: .constant(""),
            password: .constant("")
        )
    }
}
