//
//  AuthenticationViewModel.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 22/04/24.
//

import Firebase
import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country: Country = Country(isoCode: "US")
    @Published var phoneNumber: String = ""
    @Published var otpText: String = ""

    @Published var navigationTag: String?

    @Published var isLoading: Bool = false
    @Published var verificationCode: String = ""

    @Published var errorMessage = ""
    @Published var showAlert = false

    @Published var userSession: Firebase.User?
    @Published var currentUser: User?

    static let shared = AuthenticationViewModel()

    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }

    func sendOtp() async {
        if isLoading { return }

        do {
            isLoading = true
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("+\(country.phoneCode)\(phoneNumber)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.verificationCode = result
                self.navigationTag = "VERIFICATION"
            }
        } catch {
            handleError(error: error.localizedDescription)
        }
        navigationTag = "VERIFICATION"
    }

    func handleError(error: String) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMessage = error
            self.showAlert.toggle()
        }
    }

    func verifyOtp() async {
        do {
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)

            let result = try await Auth.auth().signIn(with: credential)

            let db = Firestore.firestore()

            db.collection("users").document(result.user.uid).setData([
                "name": name,
                "date": year.date,
                "id": result.user.uid,
            ]) { err in
                if let error = err {
                    print(err?.localizedDescription)
                }
            }
            DispatchQueue.main.async { [self] in
                self.isLoading = false

                self.userSession = result.user
                self.currentUser = User(name: name, date: year.date)

                print(self.userSession)
            }
        } catch {
            print("ERROR")
            handleError(error: error.localizedDescription)
        }
    }

    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }

    func fetchUser() {
        guard let uid = userSession?.uid else { return }

        let docRef = Firestore.firestore().collection("users").document(uid)

        docRef.getDocument(as: User.self) { result in

            print(result)
            switch result {
            case let .success(user):
                // An User value was successfully initialized from the DocumentSnapshot.

                self.currentUser = user

            case let .failure(error):
                // A Book value could not be initialized from the DocumentSnapshot.
                self.errorMessage = "Error decoding document: \(error.localizedDescription)"
            }
        }
    }
}
