//
//  Post.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/20/22.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    let uid: String
    let username: String
    let profileImageURL: String
    let caption: String
    let imageURL: String
    let likes: Int
    let timestamp: Date
}
