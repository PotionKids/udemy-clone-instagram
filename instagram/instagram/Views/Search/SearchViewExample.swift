//
//  SearchView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct SearchViewExample: View {
    @State private var searchText: String = ""
    @State private var inSearchMode: Bool = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    SearchBar(text: $searchText, isEditing: $inSearchMode)
                        .padding()
                    if inSearchMode {
                        UserListViewExample(viewModel: viewModel)
                    }
                    else {
                        PostGridView()
                    }
                }
            }
        }
    }
}

struct SearchViewExample_Previews: PreviewProvider {
    static var previews: some View {
        SearchViewExample()
    }
}
