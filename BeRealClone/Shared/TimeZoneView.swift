//
//  TimeZoneView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 10/04/24.
//

import SwiftUI

struct TimeZoneView: View {
    @State var area = "europe"

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("Time Zone")
                            .foregroundStyle(.white)

                            .fontWeight(.semibold)

                        HStack {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))

                            Spacer()
                        } // HStack
                    } //: ZStack
                    .padding(.horizontal)
                    Spacer()
                } //: VStack

                VStack {
                    VStack {
                        HStack {
                            Text("Select your Time Zone")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))

                            Spacer()
                        } //: HStack
                        HStack {
                            Text("To receive your BeReal Notificatio  during daytime, select your time zone. When changinyou time zone, your current BeReal will be deleted. You can only change time zone once a day ")
                                .foregroundStyle(.white)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            Spacer()
                        } //: HStack
                        .padding(.top, -8)
                    } //: VStack

                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 190)
                                .foregroundColor(.white)
                                .opacity(0.07)

                            VStack {
                                Button {
                                    self.area = "europe"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.europe.africa.fill")
                                            .foregroundColor(.white)
                                        Text("Europe")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        Spacer()

                                        if area == "europe" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.green)
                                                .font(.system(size: 14))
                                        }
                                    } // HStack
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.07)
                                    .frame(height: 30)
                                } //: Button

                                HStack {
                                    Spacer()

                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                }

                                Button {
                                    self.area = "americas"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.americas.fill")
                                            .foregroundColor(.white)
                                        Text("Americas")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        Spacer()
                                        if area == "americas" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.green)
                                                .font(.system(size: 14))
                                        }
                                    } // HStack
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.07)
                                    .frame(height: 30)
                                } //: Button

                                HStack {
                                    Spacer()

                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                }

                                Button {
                                    self.area = "eastasia"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundColor(.white)
                                        Text("East Asia")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        Spacer()

                                        if area == "eastasia" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.green)
                                                .font(.system(size: 14))
                                        }
                                    } // HStack
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.07)
                                    .frame(height: 30)
                                } //: Button

                                HStack {
                                    Spacer()

                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)
                                } // hStack

                                Button {
                                    self.area = "westasia"
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundColor(.white)

                                        Text("West Asia")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)

                                        Spacer()

                                        if area == "westasia" {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundColor(.green)
                                                .font(.system(size: 14))
                                        }
                                    } // HStack
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.07)
                                    .frame(height: 30)
                                } //: Button
                            } //: vStack
                        } //: ZStack
                        .padding(.top)
                    } //: VStack

                    Spacer()

                    Button {
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: UIScreen.main
                                .bounds.width * 0.9, height: 45)
                            .foregroundColor(Color(red: 86 / 255, green: 86 / 255, blue: 88 / 255)).overlay(
                                Text("Save")
                                    .foregroundStyle(.black)
                                    .fontWeight(.semibold)
                            )
                    } //: Button
                } //: VStack
                .padding(.top, 50)
                .padding(.horizontal)
            } //: ZStack
        } // VStack
    }
}

#Preview {
    TimeZoneView()
}
