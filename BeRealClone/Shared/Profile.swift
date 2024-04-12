//
//  Profile.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import SwiftUI

struct Profile: View {
    @Binding var mainMenu: String
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                self.mainMenu = "feed"
                            }
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }

                        Spacer()

                        Text("Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        Spacer()

                        NavigationLink(destination:
                            Settings()
                                .navigationBarBackButtonHidden()
                            , label: {
                                ThreeDots(size: 4, color: .white)
                            })
                    } // HStack
                    .padding(.horizontal)
                    Spacer()
                } //: vStack
                VStack {
                    Image("front")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(Circle())

                    Text("Eliezer")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)

                    Text("eliezer-antonio")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)

                    HStack {
                        Text("Your Memories")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))

                        Spacer()

                        HStack(spacing: 4) {
                            Image(systemName: "lock.fill")
                                .foregroundStyle(.gray)
                                .font(.system(size: 10))

                            Text("Only visible to you")
                                .foregroundStyle(.gray)
                                .font(.system(size: 10))
                        } //: HStack
                    } //: HStack
                    .padding(.horizontal)
                    .padding(.top, 4)

                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(Color.white)
                                .opacity(0.07)
                                .frame(height: 230)

                            VStack {
                                HStack {
                                    Text("Last 14 days")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16))
                                        .padding(.top, 8)

                                    Spacer()
                                }
                                .padding(.leading)

                                VStack {
                                    HStack(spacing: 4) {
                                        ForEach(1 ..< 8) { x in

                                            MemoryView(day: x)
                                        }
                                    }
                                    HStack(spacing: 4) {
                                        ForEach(1 ..< 8) { x in

                                            MemoryView(day: x + 7)
                                        }
                                    } //: HStack
                                    .padding(.top, -4)
                                } // VStack
                                .padding(.top, -4)

                                Text("View All my Memories")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 13))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray, lineWidth: 2)
                                            .frame(width: 175, height: 20)
                                            .opacity(0.5)
                                    )
                                    .padding(.top, 4)
                            } // VStack
                            .padding(.top, -15)
                        } //: ZStack
                    } // VStack

                    Text("🔗 BeRe.al/eliezer")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 15))
                        .padding(.top, 8)
                    Spacer()
                } // VStack
                .padding(.top, 20)
            } // ZStack
        } //: VStack
    }
}

#Preview {
    Profile(mainMenu: .constant("profile"))
}
