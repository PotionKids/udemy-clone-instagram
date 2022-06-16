//
//  SearchViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/16/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        Constants.collectionUsers.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {
                print("DEBUG: FAILURE: Documents not found in Firestore.")
                return
            }
            self.users = documents.compactMap { try? $0.data(as: User.self) }
            print("DEBUG: SUCCESS: Users Fetched: \(self.users)")
        }
    }
}
