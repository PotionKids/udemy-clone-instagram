//
//  Login.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/11/22.
//

import SwiftUI

struct Login: View {
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var isSecured: Bool = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: screen.minDim / 30) {
                Spacer()
                Labels.landingLogo.frame(width: 300, height: 100, alignment: .bottom)
                    .padding(.bottom)
                loginTextField
                passwordTextField
                loginButton
                forgotPasswordLine
                ORline
                loginWithFacebook
                Spacer()
                dontHaveAnAccountSignUp
            }
            .padding()
            .offset(y: -screen.height / 50)
        .ignoresSafeArea()
        }
    }
    var loginTextField: some View {
        TextField("Phone number, email or username", text: $login)
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
    
    var loginAndPassword: Bool {
        !login.isEmpty && !password.isEmpty
    }
    
    var loginButton: some View {
        Button {
            //
        } label: {
            Text("Log in")
                .font(.body.weight(.medium))
                .foregroundColor(.white)
                .fullBlueButtonify(height: .height(scaling: 25, tolerance: 0.1))
                .opacity(loginAndPassword ? 1 : 0.3)
        }
        
    }
    
    var forgotPasswordLine: some View {
        HStack {
            Text("Forgot your login details?")
                .foregroundColor(Color(UIColor.systemGray))
            forgotPasswordButton
        }
        .font(.subheadline)
    }
    
    var forgotPasswordButton: some View {
        Button {
            //
        } label: {
            Text("Get help logging in.")
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.blue)
        }
        
    }
    
    var ORline: some View {
        let line = Rectangle()
            .frame(height: screen.minDim / 450, alignment: .center)
            .foregroundColor(Color(UIColor.systemGray3))
        return HStack {
            line
            Text("OR").font(.body.weight(.medium))
            line
        }
        .foregroundColor(.gray)
        .padding(.vertical, screen.minDim / 150)
    }
    
    var loginWithFacebook: some View {
        Button {
            //
        } label: {
            HStack {
                Image("Facebook Logo 100 W")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.red)
                Text("Log in with Facebook")
                    .font(.body.weight(.bold))
            }
        }
    }
    
    var dontHaveAnAccountSignUp: some View {
        let line = Rectangle()
            .frame(height: screen.minDim / 450)
            .foregroundColor(Color(UIColor.systemGray4))
        return VStack {
            line
            HStack {
                Text("Don't have an account?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                signUpButton
                    .font(.subheadline.weight(.semibold))
            }
        }
    }
    
    var signUpButton: some View {
        NavigationLink {
            Register()
        } label: {
            Text("Sign up.")
        }
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
