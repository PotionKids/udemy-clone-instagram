////
////  PostService.swift
////  instagram
////
////  Created by Krishnaswami Rajendren on 6/21/22.
////
//
//import Foundation
//import Firebase
//
//struct PostService {
//    static func fetch(postWithID postID: String, completion: @escaping (Post) -> Void) {
//        Constants.collectionPosts
//            .document(postID)
//            .getDocument { snapshot, _ in
//                guard let post = try? snapshot?.data(as: Post.self) else { return }
//                completion(post)
//            }
//    }
//    
//    static func fetch(postsWithIDs postIDs: [String], completion: @escaping ([Post]) -> Void) {
//        var posts = [Post]()
//        for postID in postIDs {
//            fetch(postWithID: postID) { post in
//                posts.append(post)
//            }
//        }
//    }
//}
