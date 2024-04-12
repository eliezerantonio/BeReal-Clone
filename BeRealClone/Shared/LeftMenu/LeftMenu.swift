//
//  LeftMenu.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct LeftMenu: View {
    @State var width = UIScreen.main.bounds.width
    @State var menu = "suggestions"
    @Binding var mainMenu: String

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                LeftMenuTopView(mainMenu: $mainMenu)

                if menu == "suggestions" {
                    Suggestions()
                }
                if menu == "friends" {
                    FriendsView()
                }
                if menu == "requests" {
                    RequestsView()
                }

                VStack {
                    Spacer()
                    ZStack {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 22)
                                    .frame(width: width * 0.7, height: 40)
                                    .foregroundColor(Color(red: 20 / 255, green: 20 / 255, blue: 20 / 255))
                                //: undedRectangle

                                HStack(spacing: 4) {
                                    Capsule()
                                        .frame(width: 100, height: 28)
                                        .foregroundColor(Color(red: 46 / 255, green: 44 / 255, blue: 46 / 255))
                                        .opacity(menu == "suggestions" ? 1 : 0)
                                        .overlay(Text("Suggestions")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 14)))
                                        .onTapGesture {
                                            self.menu = "suggestions"
                                        }

                                    Capsule()
                                        .frame(width: 70, height: 28)
                                        .foregroundColor(Color(red: 46 / 255, green: 44 / 255, blue: 46 / 255))
                                        .opacity(menu == "friends" ? 1 : 0)

                                        .overlay(Text("Friends")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 14)))
                                        .onTapGesture {
                                            self.menu = "friends"
                                        }

                                    Capsule()
                                        .frame(width: 75, height: 28)
                                        .foregroundColor(Color(red: 46 / 255, green: 44 / 255, blue: 46 / 255))
                                        .opacity(menu == "requests" ? 1 : 0)

                                        .overlay(Text("Requests")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 14)))
                                        .onTapGesture {
                                            self.menu = "requests"
                                        }
                                } //: HStack
                            } //: ZStack
                        } //: VStack
                        .zIndex(1)

                        LinearGradient(colors: [.black, .white.opacity(0)], startPoint: .bottom, endPoint: .top)
                            .ignoresSafeArea()
                            .frame(height: 60)
                            .opacity(0.9)
                    } //: ZStack
                } //: VStack
            } //: ZStack
        } //: VStack
    }
}

#Preview {
    LeftMenu(mainMenu: .constant("left"))
}
