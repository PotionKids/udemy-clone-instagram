//
//  PhoneSignup.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/14/22.
//

import SwiftUI

struct PhoneSignup: View {
    @Binding var phoneNumber: String
    
    var body: some View {
        PhoneNumberTextFieldView(phoneNumber: $phoneNumber)
    }
}

struct PhoneSignup_Previews: PreviewProvider {
    static var previews: some View {
        PhoneSignup(phoneNumber: .constant(""))
    }
}
