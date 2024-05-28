//
//  BeReal.swift
//  BeRealClone
//
//  Created by Eliezer Antonio on 27/05/24.
//

import SwiftUI

struct BeReal: Decodable {
    var username: String
    var frontImageUrl: String
    var backImageUrl: String
    var userId: String
    var user: User?
}
