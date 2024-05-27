//
//  FriendsCellView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct FriendsCellView: View {
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
            }

            Spacer()

            Image(systemName: "xmark")
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)

        }.padding(.horizontal)
    }
}

#Preview {
    FriendsCellView()
}
