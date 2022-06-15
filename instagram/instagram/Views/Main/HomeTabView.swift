//
//  HomeTabView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct HomeTabView: View {
    @State private var selected: Tab = .home
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            TabView(selection: $selected) {
                FeedView()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                    .tag(Tab.home)
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(Tab.search)
                UploadView()
                    .tabItem {
                        Image(systemName: "plus.app.fill")
                    }
                    .tag(Tab.upload)
                NotificationsView()
                    .tabItem {
                        Image(systemName: "suit.heart")
                    }
                    .tag(Tab.notifications)
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .tag(Tab.profile)
            }
            .navigationBarItems(leading: logoutButton)
            .navigationTitle(selected.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.black)
        }
    }
    
    var logoutButton: some View {
        Button {
            authViewModel.logout()
        } label: {
            Text("Logout").font(.body.weight(.semibold))
        }

    }
}

enum Tab: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case upload = "Upload"
    case notifications = "Notifications"
    case profile = "Profile"
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
