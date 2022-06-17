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
    
    func search(users: [User], withQuery query: String) -> [User] {
        users.filter { $0.searchTerm.doesContain(query.lowercased()) }
    }

    func search(query: String) -> [User] {
        self.search(users: self.users, withQuery: query)
    }
}
