//
//  TextArea.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/20/22.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
            }
            TextEditor(text: $text)
        }
        .font(.body)
    }
}

//m
