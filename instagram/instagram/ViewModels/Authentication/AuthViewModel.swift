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
        print("Login: \(login) | Password: \(password)")
    }
    func signup(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("Successfully registered user.")
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
