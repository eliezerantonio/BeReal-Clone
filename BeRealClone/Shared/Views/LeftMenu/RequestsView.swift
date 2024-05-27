//
//  RequestsView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct RequestsView: View {
    var body: some View {
        VStack {
            ScrollView {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 64)
                    .foregroundColor(Color(red: 40 / 255, green: 40 / 255, blue: 35 / 255))
                    .overlay(
                        HStack {
                            Image("front")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text("Invite friends on BeReal")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)

                                Text("be.al/eliezeantonio")
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                        }
                        .padding(.horizontal)
                    ).padding(.horizontal)

                VStack {
                    HStack {
                        Text("Friends Requests (21)")
                            .foregroundStyle(Color(red: 205 / 255, green: 204 / 255, blue: 209 / 255))
                            .fontWeight(.semibold)
                            .font(.system(size: 14))

                        Spacer()

                        HStack {
                            Text("Sent")
                                .foregroundStyle(.gray)
                                .font(.system(size: 14))

                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        }
                    } // HStack

                    RoundedRectangle(cornerRadius: 18)
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: 90)
                        .foregroundStyle(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))
                        .overlay(
                            VStack(spacing: 8) {
                                HStack {
                                    Spacer()
                                    Text("No Pending Requests")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                    Spacer()
                                } //: HStack

                                Text("Yout don't have any pending requests")
                                    .foregroundStyle(.white)
                            } //: VStack
                        )
                } // VStack
                .padding(.top)
                Spacer()
            }.padding(.top, 20)
        }.padding(.top, 110)
    }
}

#Preview {
    RequestsView()
}
