//
//  ImageUploaderAsyncAwait.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/26/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

struct ImageUploaderAsyncAwait {
    enum UploadType: String {
        case post = "/post/image/"
        case profile = "/profile/image/"
        
        var path: StorageReference {
            Storage.storage().reference(withPath: self.rawValue + UUID().uuidString)
        }
    }
    
    enum ImageUploadError: Error {
        case compression(message: String)
        case upload(message: String)
        case url(message: String)
    }
    
    static func upload(type: UploadType, image: UIImage) async throws -> String {
        guard let data = image.jpegData(compressionQuality: 1) else { throw ImageUploadError.compression(message: "jpeg image compression failed!") }
        let _ = try await type.path.putDataAsync(data)
        return try await type.path.downloadURL().absoluteString
    }
}
