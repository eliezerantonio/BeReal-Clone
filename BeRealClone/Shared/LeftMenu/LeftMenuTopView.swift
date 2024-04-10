//
//  LeftMenuTopView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct LeftMenuTopView: View {
    @State var text = ""
    @State var isEditing = false
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Image(systemName: "arrow.forward")
                        .foregroundStyle(.white)
                } //: HStack
                Text("BeReal.")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
            } //: ZStack
            SearchBar(text: $text, isEditing: $isEditing)
            Spacer()
        } //: VStack
    }
}

#Preview {
    LeftMenuTopView()
}
