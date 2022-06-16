//
//  Signup.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/11/22.
//

import SwiftUI

struct Signup: View {
    @State var username: String = ""
    @State var fullname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var phone: String = ""
    @State var mode: SignUpMode = .email
    @State var selectedImage: UIImage?
    @State var image: Image?
    @State var showPicker = false
    
    @Binding var showing: LandingScreen
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: screen.minDim / 13) {
                Spacer()
                VStack {
                    imageUploadOrProfilePic
                    phoneOrEmailSignup
                    smsNotificationAlert
                    nextButton
                }
                .offset(y: -50)
                Spacer()
                alreadyHaveAnAccountLogin
            }
            .padding()
        }
    }
    
    
    var smsNotificationAlert: some View {
        Group {
            mode == .phone ? youMayReceiveSMS : nil
        }
    }
    @ViewBuilder
    var imageUploadOrProfilePic: some View {
        if let image = image {
            image
                .squarify().scale(by: 3)
                .clipShape(Circle())
        } else {
            imageUploadButton
        }
    }
    var imageUploadButton: some View {
        Button {
            showPicker.toggle()
        } label: {
            profileImage
        }
        .foregroundColor(.black)
        .sheet(isPresented: $showPicker) {
            loadImage()
        } content: {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
    
    var phoneOrEmailSignup: some View {
        CustomTabSwitcher(
            phone: $phone,
            username: $username,
            fullname: $fullname,
            email: $email,
            password: $password,
            mode: $mode
        )
            .padding(.vertical)
    }
    var profileImage: some View {
        let width: CGFloat = screen.minDim / 3
        return Image(systemName: LabelType.camera.rawValue)
            .font(.system(size: 100).weight(.ultraLight))
            .frame(width: width, height: width, alignment: .center)
            .overlay(alignment: .center) {
                Circle()
                    .stroke(lineWidth: 2.25)
                    .frame(width: screen.minDim / 2.5, height: screen.minDim / 2.5, alignment: .center)
                Image(systemName: LabelType.plus.rawValue)
                    .font(.system(size: 30).weight(.light))
                    .offset(y: width / 30)
            }
    }
    
    
    var fieldsAreEmpty: Bool {
        switch mode {
        case .phone:
            return  phone.isEmpty
        case .email:
            return  username.isEmpty ||
                    fullname.isEmpty ||
                    email.isEmpty ||
                    password.isEmpty
        }
    }
    
    var nextButton: some View {
        Button {
            viewModel.signup(
                withUsername: username,
                fullname: fullname,
                email: email,
                password: password,
                image: selectedImage
            )
        } label: {
            Text("Next")
                .font(.title3.weight(.medium))
                .foregroundColor(.white)
                .fullBlueButtonify(height: .height(scaling: 20, tolerance: 0.1))
                .opacity(fieldsAreEmpty ? 0.3 : 1)
        }
        .padding(.top)
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

extension Signup {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Signup(showing: .constant(.signup))
    }
}
