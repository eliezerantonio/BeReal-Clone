//
//  WhiteButtonView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 11/04/24.
//

import SwiftUI

struct WhiteButtonView: View {
    @Binding var buttonActive: Bool
    var text: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main
                    .bounds.width * 0.9, height: 45)
                .foregroundColor(buttonActive ? Color(red: 250 / 255, green: 250 / 255, blue: 250 / 255) : Color(red: 86 / 255, green: 86 / 255, blue: 88 / 255))

            HStack {
                Spacer()

                Text(text)
                    .foregroundStyle(.black)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                Spacer()
            }.padding(.horizontal, UIScreen.main.bounds.width * 0.1)
             .frame(height: 30) 
            
        }
    }
}

#Preview {
    WhiteButtonView(buttonActive: .constant(true), text: "Save")
}
