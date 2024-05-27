//
//  Feed.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import Kingfisher
import SwiftUI
struct FeedView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Binding var mainMenu: String
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ZStack {
                ScrollView {
                    VStack {
                        VStack {
                            ZStack {
                                VStack(alignment: .leading) {
                                    Image("back")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(5)
                                } //: VSTACK

                                VStack {
                                    HStack {
                                        Image("front")
                                            .resizable()
                                            .scaledToFit()
                                            .border(.black)
                                            .cornerRadius(2)
                                            .frame(width: 20, height: 40)
                                            .padding(.leading)

                                        Spacer()
                                    }
                                    .padding(.top, 18)
                                    Spacer()
                                }
                            } //: ZSTACK
                            .frame(width: 100)
                        }
                        VStack {
                            Text("Add a caption...")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)

                            Text("View Comment")
                                .foregroundStyle(.gray)
                            HStack {
                                Text("Enchede, Enched-North 1 hr late")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))

                                ThreeDots(size: 3, color: .gray)
                            } //: HStack
                        } // VStack

                        ForEach(1 ..< 8) { _ in

                            FeedCell()
                        }
                    } //: VSTACK
                    .padding(.top, 100)
                }
                VStack {
                    VStack {
                        HStack {
                            Button {
                                withAnimation {
                                    self.mainMenu = "left"
                                }
                            } label: {
                                Image(systemName: "person.2.fill")
                                    .foregroundStyle(.white
                                    )
                            }
                            Spacer()

                            Text("BeReal")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 22))

                            Spacer()

                            Button {
                                withAnimation {
                                    self.mainMenu = "profile"
                                }
                            } label: {
                                if let profileImageUrl = viewModel.currentUser!.profileImageUrl {
                                    KFImage(URL(string: profileImageUrl))
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(60)
                                } else {
                                    Circle()
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(17.5)
                                        .foregroundStyle(Color(red: 152 / 255, green: 163 / 255, blue: 16 / 255))
                                        .overlay(
                                            Text(viewModel.currentUser!.name.prefix(1).uppercased())
                                                .font(.system(size: 15))
                                                .foregroundStyle(.white)
                                        )
                                }
//                                Image("eliezer")
//                                    .resizable()
//                                    .frame(width: 40, height: 50)
//                                    .clipShape(Circle())
                            }
                        } //: HSTACK
                        .padding(.horizontal)

                        HStack {
                            Text("My Friends")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)

                            Text("Discovery")
                                .foregroundStyle(.gray)
                        } //: HSTACK
                    } // VSTACK
                    Spacer()
                } //: VSTACK
            } //: ZTSTACK
        } //: ZSTACK
        .onAppear {
            KingfisherManager.shared.cache.clearMemoryCache()
        }
    }
}

#Preview {
    FeedView(mainMenu: .constant("feed"))
}