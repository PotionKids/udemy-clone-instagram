//
//  User.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/16/22.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    @DocumentID var id: String?
//    let uid: String
    let username: String
    let fullname: String
    let email: String
    let profileImageURL: String
}
