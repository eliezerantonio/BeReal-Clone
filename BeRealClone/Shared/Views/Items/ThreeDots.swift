//
//  ThreeDots.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import SwiftUI

struct ThreeDots: View {
    var size: CGFloat
    var color: Color

    var body: some View {
        HStack {
            Image(systemName: "circle.fill")
                .foregroundStyle(color)
                .font(.system(size: size))
            Image(systemName: "circle.fill")
                .foregroundStyle(color)
                .font(.system(size: size))
            Image(systemName: "circle.fill")
                .foregroundStyle(color)
                .font(.system(size: size))
        }
    }
}

#Preview {
    ThreeDots(size: 4, color: .black)
}
