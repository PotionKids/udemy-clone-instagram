//
//  AuthViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/15/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withLogin login: String, password: String) {
        Auth.auth().signIn(withEmail: login, password: password) { result, error in
            if let error = error {
                print("DEBUG: FAILURE: Login failed due to error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    func signup(withUsername username: String, fullname: String, email: String, password: String, image: UIImage?) {
        guard let image = image else {
            return
        }

        ImageUploader.upload(image: image) { imageURL in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print("DEBUG: SUCESS: Successfully registered user.")
                
                let data = [
                                Constants.username: username,
                                Constants.fullname: fullname,
                                Constants.email: email,
                                Constants.profileImageURL: imageURL,
                                Constants.uID: user.uid
                           ]
                Firestore.firestore().collection(Constants.users).document(user.uid).setData(data) { _ in
                    print("DEBUG: SUCESS: Successfully uploaded user data.")
                    self.userSession = user
                }
            }
        }
    }
    func logout() {
        self.userSession = nil
        
        try? Auth.auth().signOut()
    }
    func reset() {
        print("Reset")
    }
    func fetch() {
        print("Fetch")
    }
}
