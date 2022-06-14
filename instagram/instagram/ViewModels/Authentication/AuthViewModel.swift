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
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login() {
        print("Login")
    }
    func signup() {
        print("Signup")
    }
    func logout() {
        print("Logout")
    }
    func reset() {
        print("Reset")
    }
    func fetch() {
        print("Fetch")
    }
}
