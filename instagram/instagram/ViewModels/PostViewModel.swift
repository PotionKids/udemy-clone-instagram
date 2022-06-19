//
//  PostViewModel.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/19/22.
//

import Foundation
import SwiftUI
import Firebase

class PostViewModel: ObservableObject {
    
    func post(withCaption caption: String, AndImage image: UIImage, completion: FirestoreCompletion?) {
        guard let user = AuthViewModel.shared.user else { return }
        
        ImageUploader.upload(type: .post, image: image) { imageURL in
            let data = [
                Constants.uID: user.id ?? "",
                Constants.username: user.username,
                Constants.profileImageURL: user.profileImageURL,
                Constants.caption: caption,
                Constants.imageURL: imageURL,
                Constants.likes: 0
            ] as [String : Any]
            
            Constants.collectionPosts.addDocument(data: data, completion: completion)
        }
    }
}
