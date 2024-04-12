//
//  Settings.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 09/04/24.
//

import SwiftUI

struct Settings: View {
    @State var width = UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.black.ignoresSafeArea()

                    VStack {
                        ZStack {
                            Text("Settings")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)

                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "arrow.backward")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20))
                                }
                                Spacer()
                            } // HStack
                        } // ZStack
                        .padding(.horizontal)

                        Spacer()
                    } // VStack
                    .padding(.top, -10)
                    VStack {
                        NavigationLink {
                            EditProfile().navigationBarBackButtonHidden()
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(
                                    width: width * 0.9, height: 90)
                                .foregroundColor(.white)
                                .opacity(0.07)
                                .overlay(
                                    HStack {
                                        Image("front")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(30)

                                        VStack(alignment: .leading) {
                                            Text("Eliezer")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 18))

                                            Text("eliezerantonio")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 14))
                                        } //: VStack
                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.gray)
                                    } // HStack
                                    .padding(.horizontal, 18)
                                )
                        }
                        VStack(spacing: 6) {
                            HStack {
                                Text("Features")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)

                                Spacer()
                            }

                            NavigationLink(destination: MemoriesView()
                                .navigationBarBackButtonHidden()
                                , label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: width * 0.9, height: 45)
                                            .foregroundColor(.white)

                                            .opacity(0.07)

                                        HStack {
                                            Image(systemName: "calendar")
                                                .foregroundColor(.white)

                                            Text("Memories")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                })
                        }
                        .padding(.top, 12)

                        HStack {
                            Text("Settings")
                                .foregroundStyle(.gray)
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                                .padding(.horizontal, width * 0.05)
                            Spacer()
                        } // HStack

                        // MARK: - Settings

                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: width * 0.9, height: 145)
                                .foregroundColor(.white)
                                .opacity(0.07)

                            VStack {
                                NavigationLink {
                                    NotificationsView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    HStack {
                                        Image(systemName: "square.and.pencil")
                                            .foregroundColor(.white)

                                        Text("Notifications")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)

                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    }.padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                }

                                Rectangle()
                                    .frame(width: width * 0.9, height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)

                                NavigationLink {
                                    TimeZoneView().navigationBarBackButtonHidden()
                                } label: {
                                    HStack {
                                        Image(systemName: "globe.europe.africa.fill")
                                            .foregroundColor(.white)

                                        Text("Time zome: Africa")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)

                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    }.padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                }

                                Rectangle()
                                    .frame(width: width * 0.9, height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)

                                NavigationLink {
                                    OtherView().navigationBarBackButtonHidden()
                                } label: {
                                    HStack {
                                        Image(systemName: "hammer.circle")
                                            .foregroundColor(.white)

                                        Text("Other")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)

                                        Spacer()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    }.padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                }
                            }
                        } // ZStack
                        .padding(.top, 12)

                        // MARK: - About

                        VStack(spacing: 6) {
                            HStack {
                                Text("About")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, width * 0.05)
                                Spacer()
                            } // HStack

                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(width: width * 0.9, height: 200)
                                    .foregroundColor(.white)
                                    .opacity(0.07)

                                VStack {
                                    NavigationLink {
                                    } label: {
                                        HStack {
                                            Image(systemName: "square.and.up")
                                                .foregroundColor(.white)

                                            Text("Share BeReal")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }.padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                    }

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink {
                                    } label: {
                                        HStack {
                                            Image(systemName: "star")
                                                .foregroundColor(.white)

                                            Text("Rate Be Real")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }.padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                    }

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink {
                                        HelpView()
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        HStack {
                                            Image(systemName: "lifepreserver")
                                                .foregroundColor(.white)

                                            Text("Help")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }.padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                    }

                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundColor(.gray)

                                    NavigationLink {
                                    } label: {
                                        HStack {
                                            Image(systemName: "info.circle")
                                                .foregroundColor(.white)

                                            Text("About")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)

                                            Spacer()

                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }.padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                    }
                                }
                            } // ZStack
                            .padding(.top, 12)
                        } //: VStack
                        .padding(.top, 12)

                        // LOGOUT

                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: width * 0.9, height: 45)
                                .foregroundColor(.white)
                                .opacity(0.07)

                            HStack {
                                Spacer()

                                Text("Log out")
                                    .foregroundStyle(.red)
                                Spacer()
                            } // HStack
                            .padding(.horizontal, width * 0.1)
                            .frame(height: 30)
                        } // ZStack
                        .padding(.top, 12)

                        Text("Version 0.27.0 (8183) - Production ")
                            .foregroundStyle(.gray)
                            .fontWeight(.semibold)
                            .font(.system(size: 12))
                            .padding(.top, 12)
                    } // VStack
                } // ZStack
            }.navigationBarHidden(true)
        } // VStack
    }
}

#Preview {
    Settings()
}
