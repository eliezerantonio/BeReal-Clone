//
//  SearchBar.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool

    var body: some View {
        HStack {
            TextField("", text: $text)
                .padding(8)
                .frame(height: 50)
                .padding(.horizontal, 24)
                .foregroundColor(.white)
                .background(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: 25, alignment: .leading)

                        Text(text.isEmpty ? "Add or search freinds" : "")
                            .foregroundStyle(.gray)
                            .padding(.leading, -4)
                        Spacer()
                    } //: HStack
                    .padding(.leading, 4)
                )

            if isEditing {
                Button {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.endEditing()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.white)
                }.padding(.trailing, 8)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
            } // IF
        } //: HStack
        .onTapGesture {
            self.isEditing = true
        }
    }
}

#Preview {
    SearchBar(text: .constant(""), isEditing: .constant(true))
}
