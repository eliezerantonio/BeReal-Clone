//
//  BeRealCloneApp.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 08/04/24.
//

import FirebaseCore
import SwiftUI

@main
struct BeRealCloneApp: App {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(AuthenticationViewModel.shared)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
}
