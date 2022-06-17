//
//  SearchView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct SearchView: View {
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
                        UserList(searchViewModel: viewModel, searchText: $searchText)
                    }
                    else {
                        PostGridView()
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
