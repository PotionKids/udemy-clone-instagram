//
//  User.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/16/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageURL: String
    
    var searchTerm: String {
        (username + " " + fullname).lowercased()
    }
}
