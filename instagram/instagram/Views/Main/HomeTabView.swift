//
//  HomeTabView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                UploadView()
                    .tabItem {
                        Image(systemName: "plus.app.fill")
                    }
                NotificationsView()
                    .tabItem {
                        Image(systemName: "suit.heart")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.black)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
