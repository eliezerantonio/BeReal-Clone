//
//  User.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 15/05/24.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

struct User: Decodable, Identifiable {
    @DocumentID var id: String?
    var username: String?
    var profileImageUrl: String?
    var name: String
    var date: String
    var bio: String?
    var location: String?
}
