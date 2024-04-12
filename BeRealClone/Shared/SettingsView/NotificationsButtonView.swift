//
//  NotificationsButtonView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 11/04/24.
//

import SwiftUI

struct NotificationsButtonView: View {
    var icon: String
    var text: String

    @Binding var toggle: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 45)
                .foregroundColor(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))

            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                Spacer()

                Toggle("", isOn: $toggle)
            } //: HStack
            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
            .frame(height: 30)
        } //: ZStack
    } //: Body
}

#Preview {
    NotificationsButtonView(icon: "face.smiling.fill", text: "RealMojis", toggle: .constant(false))
}
