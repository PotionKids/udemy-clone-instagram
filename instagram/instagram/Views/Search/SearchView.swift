//
//  SearchView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        ScrollView {
            // Search Bar
            SearchBar(text: $searchText)
                .padding()
            
            
            // Grid View with Results Display
//            PostGridView()
            
            
            // User List view
            UserListView()
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
