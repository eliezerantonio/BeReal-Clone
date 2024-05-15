//
//  EnterAgeView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 12/04/24.
//

import Combine
import SwiftUI

struct EnterAgeView: View {
    @Binding var year: Year
    @Binding var name: String

    @Binding var ageButtonClicked: Bool

    @State var buttonActive: Bool = false

    @EnvironmentObject var viewModel: AuthenticationViewModel

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
                    } //: HStack
                    Spacer()
                } //: VStack

                VStack(alignment: .center, spacing: 8) {
                    Text("Hi, when's your birthday?")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))

                    HStack(spacing: 4) {
                        Text("MM")
                            .foregroundStyle(year.month.isEmpty ? Color(red: 70 / 255, green: 70 / 255, blue: 73 / 255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 72)
                            .overlay(
                                TextField("", text: $year.month)
                                    .foregroundColor(.white)
                                    .font(.system(size: 45, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(year.month), perform: { newValue in
                                        let filtered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtered != newValue {
                                            self.year.month = filtered
                                        }
                                    }).onReceive(Just(year.month), perform: { _ in
                                        if year.month.count > 2 {
                                            year.month = String(year.month.prefix(2))
                                        }
                                    })
                            )

                        Text("DD")
                            .foregroundStyle(year.day.isEmpty ? Color(red: 70 / 255, green: 70 / 255, blue: 73 / 255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 60)
                            .overlay(
                                TextField("", text: $year.day)
                                    .foregroundColor(.white)
                                    .font(.system(size: 45, weight: .heavy))
                                    .multilineTextAlignment(.center)

                                    .onReceive(Just(year.day), perform: { newValue in
                                        let filtered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtered != newValue {
                                            self.year.day = filtered
                                        }
                                    }).onReceive(Just(year.day), perform: { _ in
                                        if year.day.count > 2 {
                                            year.day = String(year.day.prefix(2))
                                        }
                                    }).keyboardType(.numberPad)
                            )

                        Text("YYYY")
                            .foregroundStyle(year.year.isEmpty ? Color(red: 70 / 255, green: 70 / 255, blue: 73 / 255) : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 120)
                            .overlay(
                                TextField("", text: $year.year)
                                    .foregroundColor(.white)
                                    .font(.system(size: 45, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(year.year), perform: { newValue in
                                        let filtered = newValue.filter {
                                            Set("0123456789").contains($0)
                                        }

                                        if filtered != newValue {
                                            self.year.year = filtered
                                        }
                                    }).onReceive(Just(year.year), perform: { _ in
                                        if year.year.count > 4 {
                                            year.year = String(year.year.prefix(4))
                                        }
                                    })
                            )
                    }
                    Spacer()
                } //: VStack
                .padding(.top, 50)

                VStack {
                    Spacer()
                    Text("Only to make sure you're old enought to use BeReal")
                        .foregroundStyle(Color(red: 70 / 255, green: 70 / 255, blue: 73 / 255))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))

                    Button {
                        if buttonActive {
                            ageButtonClicked = true
                        }

                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: year.month) { newValue in
                                if !newValue.isEmpty {
                                    buttonActive = true
                                } else if newValue.isEmpty {
                                    buttonActive = false
                                }
                            }
                    }
                }
            } //: ZStack
        } //: VStack
    } //: Body
}
