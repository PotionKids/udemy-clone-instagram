//
//  UploadView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct UploadView: View {
    var imageName = "KH Profile Pic"
    @State var selectedImage: UIImage? = UIImage(named: "KH Profile Pic")!
    @State var postImage: Image? = Image("KH Profile Pic")
    @State var caption = ""
    
    var body: some View {
        if let image = postImage {
            VStack {
                HStack {
                    Labels.postGridLabel(for: Posts.rockPost2, withScaling: 3)
                    TextField("Enter your caption...", text: $caption)
                        .frame(maxHeight: screen.minDim / 3.4, alignment: .topLeading)
                        .textFieldify()
                }
                .padding(.vertical)
                Text("Post")
                    .profileFullButtonify()
                    .blueButtonify()
            }
            .padding()
        } else {
            VStack {
                Image(systemName: "plus.circle").font(.system(size: 150).weight(.ultraLight))
                Text("Photo").font(.title3)
            }
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
