//
//  ContentView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selected: Tab = .home
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                Opening(selected: $selected)
            } else {
                if let user = viewModel.user {
                    HomeTabView(selected: $selected, user: user)
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
////        SearchView()
//    }
//}
