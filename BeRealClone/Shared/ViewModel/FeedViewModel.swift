//
//  FeedViewModel.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 27/05/24.
//

import Firebase
import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var bereals = [BeReal]()

    @Published var blur = false

    let user: User
    init(user: User) {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy"
        let dateString = formatter.string(from: date)

        self.user = user

        Task {
            await fecthData(date: dateString)
        }
    }

    func fecthData(date: String) async {
        let db = Firestore.firestore()

        do {
            let data = try await db.collection("posts").document(date).collection("bereals").getDocuments()
            bereals = data.documents.compactMap({ try? $0.data(as: BeReal.self) })
        } catch {
            print(error.localizedDescription)
        }
    }
}
