//
//  SearchBar.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                TextField("Search...", text: $text)
                    .padding(screen.width / 50)
                    .padding(.horizontal, screen.width / 16)
                    .background(Color(.systemGray5))
                    .cornerRadius(screen.width / 50)
                    .overlay {
                        HStack {
                            Labels.search
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, screen.width / 50)
                                .opacity(0.2)
                        }
                    }
                    .onTapGesture {
                        isEditing = true
                    }
            }
            if isEditing {
                HStack {
                    Spacer()
                    Button {
                        isEditing = false
                        text = ""
                        hideKeyboard()
                    } label: {
                        Text("Cancel")
                    }
                }
                .foregroundColor(.black)
                .padding(.horizontal)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
