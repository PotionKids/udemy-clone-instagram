//
//  EmailSignup.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/14/22.
//

import SwiftUI

struct EmailSignup: View {
    @Binding var email: String
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .font(.title3)
            .textFieldify(withHeightScaling: 25)
        }
    }
}

struct EmailSignup_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignup(email: .constant(""))
    }
}
