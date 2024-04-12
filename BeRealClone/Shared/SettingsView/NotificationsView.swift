//
//  NotificationsView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 11/04/24.
//

import SwiftUI

struct NotificationsView: View {
    @State var mentions = false
    @State var comments = false
    @State var friendRequest = false
    @State var lateBeReal = false
    @State var realMojis = false
    @State var buttonActive = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("Notifications")
                                .fontWeight(.semibold)
                        }

                        HStack {
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 20))

                            Spacer()
                        }
                    }.padding(.horizontal)

                    Spacer()
                }.foregroundStyle(.white)

                VStack {
                    VStack {
                        HStack {
                            Text("On BeReal, you're in control of yout push notification.")
                                .fontWeight(.semibold)
                            Spacer()
                        }

                        HStack {
                            Text("You can choose the type of notifcations you want to receive.")
                                .fontWeight(.semibold)

                            Spacer()
                        }

                    }.foregroundColor(.white)
                        .font(.system(size: 16))

                    VStack(spacing: 14) {
                        VStack {
                            NotificationsButtonView(icon: "person.crop.square.filled.and.at.rectangle", text:
                                "Mentions", toggle: $mentions)

                            HStack {
                                Text("Dikayasila mentioned you on seanlund's BeReal")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)

                                Spacer()
                            } //: HStack
                        } //: VStack
                    } //: VStack

                    VStack {
                        NotificationsButtonView(icon: "bubble.left.fill", text:
                            "Comments", toggle: $comments)

                        HStack {
                            Text("ercimmiayal commented on your BeReal")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)

                            Spacer()
                        } //: HStack
                    } //: VStack
                    .padding(.top)

                    VStack {
                        NotificationsButtonView(icon: "person.2.fill", text:
                            "Friends requests", toggle: $friendRequest)

                        HStack {
                            Text("ercimmiayal just sent you a friend request")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)

                            Spacer()
                        } //: HStack
                    } //: VStack
                    .padding(.top)

                    VStack {
                        NotificationsButtonView(icon: "timer", text:
                            "Late BeReal", toggle: $lateBeReal)

                        HStack {
                            Text("Zeymustu just posted late")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)

                            Spacer()
                        } //: HStack
                    } //: VStack
                    .padding(.top)

                    VStack {
                        NotificationsButtonView(icon: "face.smiling.fill", text:
                            "RealMojis", toggle: $realMojis)

                        HStack {
                            Text("ercimmiayal commented on your BeReal")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12))
                                .padding(.leading)

                            Spacer()
                        } //: HStack
                    } //: VStack
                    .padding(.top, 8)

                    Spacer()
                } //: VStack
                .padding(.horizontal)
                .padding(.top, 50)

                VStack {
                    Spacer()
                    WhiteButtonView(buttonActive: $buttonActive, text: "Save").onChange(of: mentions || comments || friendRequest || lateBeReal || realMojis) { _ in

                        self.buttonActive = true
                    }
                }
            } //: ZStack
        } //: VStack
    }
}

#Preview {
    NotificationsView()
}
