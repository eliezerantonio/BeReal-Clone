//
//  ContentView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    @State var width = UIScreen.main.bounds.width
    @State var menu: String = "feed"

    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        NavigationView {
            HStack(spacing: 0) {
                LeftMenu(mainMenu: $menu)
                    .frame(width: width)

                FeedView(feedModel: FeedViewModel(user: viewModel.currentUser!), menu: $menu)
                    .frame(width: width)

                Profile(mainMenu: $menu)
                    .frame(width: width)
            } //: HStack
            .offset(x: menu == "left" ? width : 0)
            .offset(x: menu == "profile" ? -width : 0)
            .onChange(of: menu) { _ in
                simpleSuccess()
            }
        }
    }
}

#Preview {
    ContentView()
}
