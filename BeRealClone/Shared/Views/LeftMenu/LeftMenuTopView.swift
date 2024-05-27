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

    @Binding var mainMenu: String

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            self.mainMenu = "feed"
                        }
                    } label: {
                        Image(systemName: "arrow.forward")
                            .foregroundStyle(.white)
                    }
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
    LeftMenuTopView(mainMenu: .constant("left"))
}
