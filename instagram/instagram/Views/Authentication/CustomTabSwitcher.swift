//
//  CustomTabSwitcher.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/14/22.
//

import SwiftUI

enum SignUpMode: String, CaseIterable {
    case phone = "PHONE"
    case email = "EMAIL"
}

struct CustomTabSwitcher: View {
    @Binding var phone: String
    @Binding var username: String
    @Binding var fullname: String
    @Binding var email: String
    @Binding var password: String
    
    @Binding var mode: SignUpMode
    
    var modes: [SignUpMode] = [.phone, .email]
    
    var body: some View {
        VStack(spacing: screen.minDim / 13) {
            HStack {
                ForEach(modes, id: \.self) { mode in
                    Button {
                        self.mode = mode
                    } label: {
                        VStack {
                            tabTitle(for: mode)
                            underline(for: mode)
                        }
                    }
                }
            }
            
            switch mode {
            case .phone:
                PhoneSignup(phoneNumber: $phone)
            case .email:
                EmailSignup(
                    username: $username,
                    fullname: $fullname,
                    email: $email,
                    password: $password
                )
            }
        }
    }
    
    func tabTitle(for mode: SignUpMode) -> some View {
        Text(mode.rawValue)
            .font(.title3.weight(.semibold))
            .foregroundColor(self.mode == mode ? .black : .gray)
    }
    
    func underline(for mode: SignUpMode) -> some View {
        Rectangle()
            .frame(width: screen.width / 2.2, height: self.mode == mode ? 1.25 : 1, alignment: .center)
            .foregroundColor(self.mode == mode ? .black : .gray)
    }
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabSwitcher(
            phone: .constant(""),
            username: .constant(""),
            fullname: .constant(""),
            email: .constant(""),
            password: .constant(""),
            mode: .constant(.email)
        )
    }
}
