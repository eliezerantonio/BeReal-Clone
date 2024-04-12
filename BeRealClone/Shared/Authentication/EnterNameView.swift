//
//  EnterNameView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 11/04/24.
//

import SwiftUI

struct EnterNameView: View {
    @State var name: String = ""
    @State var buttonActive = false

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    HStack {
                        Spacer()
                        Text("BeReal.")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                VStack {
                    VStack(alignment: .center, spacing: 8) {
                        Text("Let's get started. what's your name?")

                            .fontWeight(.heavy)
                            .font(.system(size: 16))

                        Text(name.isEmpty ? "Your name" : "")
                            .foregroundStyle(name.isEmpty ? Color(red: 70 / 255, green: 70 / 255, blue: 73 / 255) : Color.black)
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                            .frame(width: 210)
                            .overlay(
                                TextField("", text: $name)
                                    .font(.system(size: 40, weight: .heavy))
                            )

                    }.foregroundStyle(.white)

                    Spacer()
                }
                .padding(.top, 50)
                VStack {
                    Spacer()
                    WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                        .onChange(of: name) { newValue in
                            if !newValue.isEmpty {
                                buttonActive = true
                            } else if newValue.isEmpty {
                                buttonActive = false
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    EnterNameView()
}
