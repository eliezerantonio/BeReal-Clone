//
//  FeedCell.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import Kingfisher
import SwiftUI

struct FeedCell: View {
    var bereal: BeReal
    var blur: Bool
    @ObservedObject var viewModel: FeedCellViewModel

    init(bereal: BeReal, blur: Bool, viewModel: FeedCellViewModel) {
        self.bereal = bereal
        self.blur = blur
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading) {
                // USERNAME
                HStack {
                    if let userUrl = viewModel.beReal.user?.profileImageUrl {
                        KFImage(URL(string: userUrl))
                            .resizable()
                            .frame(width: 40, height: 30)
                            .cornerRadius(20)
                    } else {
                        Circle()
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                            .foregroundColor(Color(red: 152 / 255, green: 163 / 255, blue: 16 / 255))
                            .overlay(
                                Text(viewModel.beReal.username.prefix(1))
                                    .textCase(.uppercase)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            )
                    }

                    VStack(alignment: .leading) {
                        if let user = viewModel.beReal.user {
                            Text(user.name)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                        }

                        Text("Enschede 7 hr late")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                    Spacer()

                    ThreeDots(size: 4, color: .gray)
                }
                .padding(.horizontal)

                // IMAGE
                VStack(alignment: .leading) {
                    ZStack {
                        ZStack {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()

                                    VStack {
                                        Image(systemName: "bubble.left.fill")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 25))
                                            .shadow(color: .black, radius: 3, x: 1, y: 1)

                                        Image(systemName: "face.smiling.fill")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 25))
                                            .shadow(color: .black, radius: 3, x: 1, y: 1)
                                            .padding(.top, 15)
                                    } //: vStack
                                    .padding(.trailing, 20)
                                    .padding(.bottom, 50)
                                } // VStack
                            }.zIndex(1)

                            VStack(alignment: .leading) {
                                KFImage(URL(string: bereal.backImageUrl))
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width)
                                    .scaledToFit()
                                    .cornerRadius(20)
                            } //: VSTACK
                            GeometryReader { _ in

                                VStack {
                                    HStack {
                                        KFImage(URL(string: bereal.frontImageUrl))
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(8)
                                            .frame(height: 160)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 3))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                            }
                        } //: ZSTACK
                        .blur(radius: blur ? 8 : 0)

                        if blur {
                            VStack {
                                Image(systemName: "eye.slash.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                Text("Post to view")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text("To view your friend'  BeReal, share yours with them")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 14))
                                    .padding(.top, -4)

                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.white)
                                    .frame(width: 180, height: 40)
                                    .overlay(
                                        Text("Post a Late BeReal")
                                            .foregroundStyle(.black)
                                            .font(.system(size: 12))
                                    ).padding(.top, 6)
                            }
                        }
                    }

                    Text(blur ? "" : "Add a comment...")
                        .foregroundStyle(.gray)
                        .fontWeight(.semibold)
                        .padding(.leading, 4)
                }
            } //: VSTACK
            .frame(width: UIScreen.main.bounds.width, height: 600)
        } //: ZTASCK
    }
}
