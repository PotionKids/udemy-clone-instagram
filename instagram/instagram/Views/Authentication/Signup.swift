//
//  Signup.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/11/22.
//

import SwiftUI

struct Signup: View {
    @State var email: String = ""
    @State var phone: String = ""
    @Binding var showing: LandingScreen
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            VStack(spacing: screen.minDim / 13) {
                Spacer()
                VStack {
                    profileImage
                    CustomTabSwitcher(phone: $phone, email: $email)
                        .padding(.vertical)
                    youMayReceiveSMS
                    nextButton
                        .padding(.top)
                }
                .offset(y: -50)
                Spacer()
                alreadyHaveAnAccountLogin
            }
            .padding()
        }
    }
    
    var profileImage: some View {
        Image(systemName: LabelType.person.rawValue)
            .font(.system(size: 100).weight(.ultraLight))
            .frame(width: screen.minDim / 3, height: screen.minDim / 3, alignment: .center)
            .overlay(
                Circle()
                    .stroke(lineWidth: 2.25))
    }
    
    var fieldsAreEmpty: Bool {
        email.isEmpty && phone.isEmpty
    }
    
    var nextButton: some View {
        Button {
            mode.wrappedValue.dismiss()
        } label: {
            Text("Next")
                .font(.title3.weight(.medium))
                .foregroundColor(.white)
                .fullBlueButtonify(height: .height(scaling: 20, tolerance: 0.1))
                .opacity(fieldsAreEmpty ? 0.3 : 1)
        }
    }
    
    var alreadyHaveAnAccountLogin: some View {
        let line = Rectangle()
            .frame(height: screen.minDim / 450)
            .foregroundColor(Color(UIColor.systemGray4))
        return VStack {
            line
            HStack {
                Text("Already have an account?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                loginButton
                    .font(.subheadline.weight(.semibold))
            }
        }
    }
    
    var youMayReceiveSMS: some View {
        Text("You may receive SMS notifications from us for security and login purposes.")
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
    }
    
    var loginButton: some View {
        NavigationLink {
            Login(showing: $showing)
                .navigationBarHidden(true)
        } label: {
            Text("Log in.")
        }
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Signup(showing: .constant(.signup))
    }
}
