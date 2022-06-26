//
//  PostViewModelAsyncAwait.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/26/22.
//

import Foundation
import SwiftUI
import Firebase

class PostViewModelAsyncAwait: ObservableObject {
    var posts: [Post] = []
    
    func post(withCaption caption: String, AndImage image: UIImage, completion: FirestoreCompletion?) {
        guard let user = AuthViewModel.shared.user else { return }
        
        ImageUploader.upload(type: .post, image: image) { imageURL in
            let data = [
                Constants.uID: user.id ?? "",
                Constants.username: user.username,
                Constants.profileImageURL: user.profileImageURL,
                Constants.caption: caption,
                Constants.imageURL: imageURL,
                Constants.likes: 0,
                Constants.timestamp: Timestamp(date: Date())
            ] as [String : Any]
            
            Constants.collectionPosts.document(user.id ?? "").collection(Constants.userPosts).addDocument(data: data, completion: completion)
//            Constants.collectionPosts.addDocument(data: data, completion: completion)
        }
    }
}
