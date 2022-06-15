//
//  ImageUploader.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/15/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

struct ImageUploader {
    static func upload(image: UIImage, completion: @escaping (String) -> Void) {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        
        let file = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile/image/\(file)")
        ref.putData(data) { _, error in
            if let error = error {
                print("DEBUG: FAILURE: Failed to upload image error: \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: SUCCESS: Sucessfully uploaded image.")
            
            ref.downloadURL { url, _ in
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
}
