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
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
        if let image = postImage {
            VStack {
                postImageAndCaption(image: image)
                postButton
            }
            .padding()
        } else {
            imageUploadButton
            .sheet(isPresented: $showPicker) {
                loadImage()
            } content: {
                ImagePicker(selectedImage: $selectedImage)
            }

        }
    }
    
    func postImageAndCaption(image: Image) -> some View {
        HStack {
            scaledPost(image: image)
            captionTextField
        }
        .padding(.vertical)
    }
    
    func scaledPost(image: Image) -> some View {
        image
            .squarify()
            .scale(by: 3)
    }
    var captionTextField: some View {
        TextField("Enter your caption...", text: $caption)
            .frame(alignment: .topLeading)
            .textFieldify(heightScaling: 7.2, alignment: .topLeading)
    }
    var postButton: some View {
        Button  {
            if let image = selectedImage {
                viewModel.post(withCaption: caption, AndImage: image)
            }
        } label: {
            Text("Post")
                .font(.body.weight(.medium))
                .foregroundColor(.white)
                .fullBlueButtonify()
        }
    }
    
    var imageUploadButton: some View {
        Button {
            showPicker.toggle()
        } label: {
            VStack {
                Image(systemName: "plus.circle").font(.system(size: 150).weight(.ultraLight))
                Text("Photo").font(.title3)
            }
        }
        .buttonStyle(PlainButtonStyle())
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
