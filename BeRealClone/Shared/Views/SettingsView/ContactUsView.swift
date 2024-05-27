//
//  ContactUsView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 11/04/24.
//

import SwiftUI

struct ContactUsView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Text("How can we help you?")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)

                        HStack {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                        } // HStack
                    } //: ZStack
                    Spacer()
                } //: VStack
                VStack {
                    VStack(spacing: 28) {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))

                            HStack {
                                Image(systemName: "questionmark.circle")

                                Text("Ask a Question")
                            } //: HStack
                            .foregroundColor(.white)
                        } //: ZStack

                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))

                            HStack {
                                Image(systemName: "ladybug")

                                Text("Report a Problem")
                            } //: HStack
                            .foregroundColor(.white)
                        } //: ZStack

                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28 / 255, green: 28 / 255, blue: 30 / 255))

                            HStack {
                                Image(systemName: "atom")

                                Text("Become Beta Tester")
                            } //: HStack
                            .foregroundColor(.white)
                        } //: ZStack
                    } //: VStack
                    Spacer()
                } //: VStack
                .padding(.horizontal)
                .padding(.top, 60)
            } //: ZStack
        } //: VStak
    } //: Body
}

#Preview {
    ContactUsView()
}
