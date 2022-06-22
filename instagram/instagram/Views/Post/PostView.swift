//
//  UploadView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct PostView: View {
    var imageName = "KH Profile Pic"
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var caption = ""
    @State var placeholder = "Enter your caption..."
    @State var showPicker = false
    @Binding var selected: Tab
    @ObservedObject var viewModel = PostViewModel()
    
    var body: some View {
        if let image = postImage {
            VStack {
                postImageAndCaption(image: image)
                postAndCancelButtons
            }
            .padding()
            .offset(y: -screen.minDim / 9)
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
        TextArea(text: $caption, placeholder: "Enter caption here...")
            .frame(height: screen.height / 7)
    }
    
    var postAndCancelButtons: some View {
        HStack {
            cancelButton
            postButton
        }
    }
    var cancelButton: some View {
        Button {
            caption = ""
            postImage = nil
        } label: {
            Text("Cancel")
                .font(.body.weight(.medium))
                .foregroundColor(.white)
                .halfButtonify()
                .redButtonify()
        }

    }
    
    var postButton: some View {
        Button  {
            if let image = selectedImage {
                viewModel.post(withCaption: caption, AndImage: image) { _ in
                    caption = ""
                    postImage = nil
                    selected = .home
                }
            }
        } label: {
            Text("Post")
                .font(.body.weight(.medium))
                .foregroundColor(.white)
                .halfButtonify()
                .blueButtonify()
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

extension PostView {
    func loadImage() {
        guard let image = selectedImage else { return }
        postImage = Image(uiImage: image)
    }
}
