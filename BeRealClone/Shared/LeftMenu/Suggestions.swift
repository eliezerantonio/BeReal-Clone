//
//  Suggestions.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct Suggestions: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .center, content: {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 64)
                        .foregroundColor(Color(red: 40 / 255, green: 40 / 255, blue: 35 / 255))
                        .overlay(
                            HStack {
                                Image("front")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(30)

                                VStack(alignment: .leading) {
                                    Text("Invite friends on BeReal")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)

                                    Text("be.al/eliezeantonio")
                                        .foregroundStyle(.white)
                                }
                                Spacer()
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            }
                            .padding(.horizontal)
                        ).padding(.horizontal)

                    VStack {
                        HStack {
                            Text("Add Your Contacts")
                                .foregroundStyle(Color(red: 205 / 255, green: 204 / 255, blue: 209 / 255))
                                .fontWeight(.semibold)
                                .font(.system(size: 14))

                            Spacer()
                        } //: HStack

                        ForEach(1 ..< 16) { _ in
                            SuggestionCellView()
                        } //: FOR
                    } //: VStack

                })
                Spacer()
            }.padding(.top, 110)
        }
    }
}

#Preview {
    Suggestions()
}
