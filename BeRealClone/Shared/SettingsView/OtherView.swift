//
//  OtherView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct OtherView: View {
    @State var fastCamera = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Other")
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
                        } //: HStack
                    } //: ZStack
                    Spacer()
                } //: VStack

                VStack {
                    VStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))

                            HStack {
                                Image(systemName: "camera.viewfinder")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))

                                Text("Fast Camera (reduces qaulity)")
                                    .foregroundStyle(.white)
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))

                                Toggle("", isOn: $fastCamera)
                            } //: HStack
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        } //: ZStack

                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))

                            HStack {
                                Image(systemName: "xmark.app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))

                                Text("Clear cache")
                                    .foregroundStyle(.white)
                                    .fontWeight(.medium)
                                    .font(.system(size: 14))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            } //: HStack
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        } //: ZStack

                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))

                            HStack {
                                Spacer()

                                Text("Delete Account")
                                    .foregroundStyle(.red)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                Spacer()
                            } //: HStack
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        } //: ZStack
                    } //: VStack
                    .padding(.horizontal)
                    .padding(.top, 50)

                    Spacer()
                } //: VStack
            }
        }
    }
}

#Preview {
    OtherView()
}
