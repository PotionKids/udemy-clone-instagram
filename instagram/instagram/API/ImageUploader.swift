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
    enum UploadType: String {
        case profile = "/profile/image/"
        case post = "/post/image/"
        
        var path: StorageReference {
            Storage.storage().reference(withPath: rawValue + UUID().uuidString)
        }
    }
    
    static func upload(type: UploadType, image: UIImage, completion: @escaping (String) -> Void) {
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        let ref = type.path
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
