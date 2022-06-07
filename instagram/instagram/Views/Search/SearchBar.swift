//
//  SearchBar.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
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
                    }
                }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."))
    }
}
