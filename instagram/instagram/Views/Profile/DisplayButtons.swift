//
//  DisplayButtons.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/10/22.
//

import SwiftUI

struct DisplayButtons: View {
    var body: some View {
        HStack {
            Image(systemName: "squareshape.split.3x3")
                .padding(.horizontal, screen.minDim / 10)
            Spacer()
            Image(systemName: "play.rectangle.on.rectangle")
                .padding(.horizontal)
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "triangle")
                .rotation3DEffect(Angle.degrees(90), axis: (x: 0, y: 0, z: 1))
                .padding(.horizontal)
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "person.crop.square")
                .padding(.horizontal)
                .foregroundColor(.gray)
        }
        .font(.title2.weight(.regular))
    }
}

struct DisplayButtons_Previews: PreviewProvider {
    static var previews: some View {
        DisplayButtons()
    }
}
