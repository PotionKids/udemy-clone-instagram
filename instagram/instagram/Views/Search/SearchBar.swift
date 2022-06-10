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
                    .searchBarify()
                    .onTapGesture {
                        isEditing = true
                    }
            }
            if isEditing {
                cancelButton(modifying: isEditing)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
            }
        }
    }
    
    func cancelButton(modifying: Bool) -> some View {
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
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
