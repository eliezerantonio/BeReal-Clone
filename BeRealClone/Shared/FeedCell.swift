//
//  FeedCell.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(alignment: .leading) {
                // USERNAME
                HStack {
                    Image("eliezer")
                        .resizable()
                        .frame(width: 50, height: 60)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text("Eliezer")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))

                        Text("Enschede 7 hr late")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)

                // IMAGE

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

                    VStack {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)

                        HStack {
                            Text("Add a comment...")
                                .foregroundStyle(.gray)
                                .fontWeight(.semibold)
                                .padding(.leading, 8)

                            Spacer()
                        }
                    } //: VSTACK

                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.black)
                                .frame(width: 125, height: 165)
                                .overlay(
                                    Image("front")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .frame(width: 120, height: 160)
                                )

                            Spacer()
                        } //: HStack
                        .padding(.horizontal, 20)
                        .padding(.top, 18)
                        Spacer()
                    } //: VStack
                } //: ZSTACK
            } //: VSTACK
            .frame(width: UIScreen.main.bounds.width, height: 600)
        } //: ZTASCK
    }
}

#Preview {
    FeedCell()
}
