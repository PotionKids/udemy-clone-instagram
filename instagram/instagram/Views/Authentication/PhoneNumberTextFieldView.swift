//
//  PhoneNumberTextFieldView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/14/22.
//

import SwiftUI
    
struct PhoneNumberTextFieldView : View {
    @Binding var phoneNumber: String
    @State var y : CGFloat = Constants.screenHeight
    @State var countryCode = ""
    @State var countryFlag = ""
    var body: some View {
        ZStack {
            HStack (spacing: 0) {
                
            }
            .frame(maxWidth: screen.width/1)
            HStack {
                Text(countryCode.isEmpty ? "🇮🇳 +91" : "\(countryFlag) +\(countryCode)")
                    .textFieldify(heightScaling: 25)
                    .foregroundColor(countryCode.isEmpty ? .secondary : .black)
                    .onTapGesture {
                        withAnimation (.spring()) {
                            self.y = 0
                        }
                }
                Rectangle().frame(width: 1, height: screen.height / 30)
                    .foregroundColor(.gray)
                TextField("Phone Number", text: $phoneNumber)
                    .font(.title3)
                    .textFieldify(heightScaling: 25)
                    .keyboardType(.phonePad)
//                Spacer()
            }
            CountryCodes(countryCode: $countryCode, countryFlag: $countryFlag, y: $y)
                .offset(y: y)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct PhoneNumberTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberTextFieldView(phoneNumber: .constant(""))
    }
}
