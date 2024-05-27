//
//  HelpView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 11/04/24.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Help")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }

                            Spacer()
                        }
                    }

                    Spacer()
                }

                VStack {
                    VStack(spacing: 16) {
                        ChevronButtonView(icon: "envelope", text: "Contact us")
                        ChevronButtonView(icon: "questionmark", text: "Help Center")

                        Spacer()
                    }.padding(.horizontal)
                        .padding(.top, 50)
                }
            }
        }
    }
}

#Preview {
    HelpView()
}
