//
//  EnterPhoneNumberView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 12/04/24.
//

import SwiftUI

struct EnterPhoneNumberView: View {
    @State var showCountryList: Bool = false

    @State var buttonActive: Bool = false

    @Binding var phoneNumberButtonClicked: Bool
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
                    Text("Create your account using your phone number")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))

                    HStack {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 1)
                            .frame(width: 75, height: 45)
                            .foregroundColor(.gray)
                            .overlay(
                                Text("\(viewModel.country.flag(country: viewModel.country.isoCode))") + Text("+\(viewModel.country.phoneCode)").foregroundColor(.white)
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                            )
                            .onTapGesture {
                                self.showCountryList.toggle()
                            }
                        Text("Your Phone")
                            .foregroundStyle(viewModel.phoneNumber.isEmpty ? Color.gray : Color.black)
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 220)
                            .overlay(
                                TextField("", text: $viewModel.phoneNumber)
                                    .foregroundColor(.white)
                                    .keyboardType(.numberPad)
                                    .font(.system(size: 40, weight: .heavy))
                            )
                    } // HStack
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)

                    Spacer()
                } //: VStack
                .padding(.top, 50)

                VStack {
                    Spacer()
                    Text("By Tapping \"Continue\", you agree to ou Privacy Plicy and termos of Service")
                        .foregroundStyle(Color(red: 70 / 255, green: 70 / 255, blue: 73 / 255))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)

                    Button {
                        Task {
                            await viewModel.sendOtp()
                        }
                    } label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: viewModel.phoneNumber) {
                                newValue in
                                if !newValue.isEmpty {
                                    buttonActive = true
                                } else if newValue.isEmpty {
                                    buttonActive = false
                                }
                            }
                    }.disabled(viewModel.phoneNumber.isEmpty ? true : false)
                }
            } //: ZStack
        } //: VStack
        .sheet(isPresented: $showCountryList, content: {
            SelectCountryView(countryChosen: $viewModel.country)
        })
        .overlay {
            ProgressView().opacity(viewModel.isLoading ? 1 : 0)
        }
        .background {
            NavigationLink(tag: "VERIFICATION", selection: $viewModel.navigationTag) {
                EnterCodeView()
            } label: {
            }

            .labelsHidden()
        }
        .environment(\.colorScheme, .dark)
    }
}
