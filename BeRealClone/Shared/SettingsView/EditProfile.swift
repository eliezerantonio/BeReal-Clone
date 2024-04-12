//
//  EditProfile.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 09/04/24.
//

import SwiftUI

struct EditProfile: View {
    @State var width = UIScreen.main.bounds.width
    @State var fullname = ""
    @State var username = ""
    @State var bio = ""
    @State var location = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Text("Cancel")
                                    .foregroundStyle(.white)
                            }

                            Spacer()

                            Text("Save")
                                .foregroundStyle(.gray)
                        } // HStack
                        .padding(.horizontal, width * 0.05)

                        Text("Edit Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    } //: ZStack

                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                    } //: HStack

                    Spacer()
                } // VStack
                VStack {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            Image("front")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .cornerRadius(60)

                            ZStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 34, height: 34)
                                        .foregroundColor(.black)
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                        .opacity(0.1)
                                } //: ZStack

                                Image(systemName: "camera.fill")
                                    .font(.system(size: 16))
                                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                            } //: ZStack
                        } //: ZStack
                    } //: VStack

                    // MENU
                    VStack {
                        // MARK: - fullname

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack {
                            HStack {
                                Text("Full Name")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))

                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $fullname)
                                    .font(.system(size: 16))
                                    .placeholder(when: fullname.isEmpty) {
                                        Text("Eliezer")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 16))
                                    }.foregroundStyle(.white)
                                    .padding(.leading, width * 0.05)

                                Spacer()
                            } //: HStack
                            .frame(width: width * 0.63)
                        } //: HStack

                        // MARK: - username

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack {
                            HStack {
                                Text("UserName")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))

                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $username)
                                    .font(.system(size: 16))
                                    .placeholder(when: fullname.isEmpty) {
                                        Text("eliezerantonio")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 16))
                                    }.foregroundStyle(.white)
                                    .padding(.leading, width * 0.05)

                                Spacer()
                            } //: HStack
                            .frame(width: width * 0.63)
                        } //: HStack

                        Rectangle()

                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack(alignment: .top) {
                            HStack {
                                Text("Bio")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            } //: HStack

                            .padding(.leading, -4)
                            .frame(width: width * 0.2)

                            if #available(iOS 16, *) {
                                TextEditor(text: $bio)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .scrollContentBackground(.hidden)
                                    .frame(height: 100)
                                    .padding(.leading, width * 0.05)
                                    .overlay(
                                        VStack {
                                            HStack {
                                                if bio.isEmpty {
                                                    Text("Bio").foregroundStyle(.gray)
                                                        .font(.system(size: 16))
                                                        .zIndex(1)
                                                        .padding(.top, 8)
                                                        .padding(.leading, 24)
                                                }

                                                Spacer()
                                            } // HStack
                                            Spacer()
                                        } //: VStack
                                    )
                                    .padding(.top, -8)
                                    .frame(width: width * 0.63)
                            } //: IF
                        } //: HStack

                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundStyle(.gray)
                            .opacity(0.3)

                        HStack {
                            HStack {
                                Text("Location")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16))

                                Spacer()
                            }
                            .frame(width: width * 0.22)

                            HStack {
                                TextField("", text: $location)
                                    .font(.system(size: 16))
                                    .placeholder(when: location.isEmpty) {
                                        Text("Location")
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                    }.foregroundStyle(.white)
                                    .padding(.leading, width * 0.05)

                                Spacer()
                            } //: HStack
                            .frame(width: width * 0.63)
                        } //: HStack
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)

                    Spacer()
                } //: VStack
                .padding(.top, UIScreen.main.bounds.height * 0.08)
            } //: ZStack
        } // vStack
    }
}

#Preview {
    EditProfile()
}
