//
//  ContentView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
//        HomeTabView()
//        SearchView()
//        NotificationsView()
//        Login()
//        CustomTabSwitcher()
//        CountryCodes(countryCode: .constant("91"), countryFlag: .constant("🇮🇳"), y: .constant(100))
//        PhoneNumberTextFieldView()
//        Signup(email: .constant(""), phone: .constant(""))
//        Landing(showing: .constant(.landing))
//        Opening()
        Group {
            if viewModel.userSession == nil {
                Landing(showing: .constant(.landing))
            } else {
                HomeTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
