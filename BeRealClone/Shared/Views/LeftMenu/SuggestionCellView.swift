//
//  SuggestionCellView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct SuggestionCellView: View {
    var body: some View {
        HStack {
            Image("front")
                .resizable()
                .scaledToFit()
                .frame(width: 65)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text("Eliezer")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)

                Text("eliezer-antonio")
                    .foregroundStyle(.gray)

                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))

                    Text("Eliezer")
                        .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        .padding(.leading, -4)
                } // HStack
            } //: VStack
            Spacer()

            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(red: 44 / 255, green: 44 / 255, blue: 46 / 255))
                .frame(width: 45, height: 25)
                .overlay(
                    Text("Add")
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                )
            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        } //: HStack
        .padding(.horizontal)
    }
}

#Preview {
    SuggestionCellView()
}
