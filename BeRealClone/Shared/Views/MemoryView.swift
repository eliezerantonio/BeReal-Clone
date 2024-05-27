//
//  MemoryView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import SwiftUI

struct MemoryView: View {
    var day: Int
    var body: some View {
        VStack {
            ZStack {
                Image("back")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 8, height: 70)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.white, lineWidth: 1.5)
                            .frame(width: UIScreen.main.bounds.width / 8, height: 70)

                        Text("\(day)")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
            }
        }
    }
}

#Preview {
    MemoryView(day: 12)
}
