//
//  MainView.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 15/05/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        Group {
            if viewModel.userSession == nil {
                MainAuthenticationView()
            } else {
                ContentView()
            }
        }
    }
}

#Preview {
    MainView()
}
