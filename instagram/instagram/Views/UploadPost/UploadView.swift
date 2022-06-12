//
//  UploadView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct UploadView: View {
    var imageName = "KH Profile Pic"
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var caption = ""
    @State var showPicker = false
    
    var body: some View {
        if let image = postImage {
            VStack {
                HStack {
                    image
                        .squarify()
                        .scale(by: 3)
                    TextField("Enter your caption...", text: $caption)
                        .textFieldify(withHeightScaling: 7.2)
                }
                .padding(.vertical)
                Button  {
                    //
                } label: {
                    Text("Post")
                        .profileFullButtonify()
                        .blueButtonify()
                }
            }
            .padding()
        } else {
            Button {
                showPicker.toggle()
            } label: {
                VStack {
                    Image(systemName: "plus.circle").font(.system(size: 150).weight(.ultraLight))
                    Text("Photo").font(.title3)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showPicker) {
                loadImage()
            } content: {
                ImagePicker(selectedImage: $selectedImage)
            }

        }
    }
}

extension UploadView {
    func loadImage() {
        guard let image = selectedImage else { return }
        postImage = Image(uiImage: image)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
