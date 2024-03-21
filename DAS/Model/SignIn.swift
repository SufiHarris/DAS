//
//  SignInResponse.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 21/03/24.
//

import Foundation




// MARK: - Welcome
struct SignIn : Codable {
    let status: Int?
    let data: DataClass?
    let success, isValidationError: Bool?
    let messages: [String]?
    let totalCount: Int?
}

// MARK: - DataClass
struct DataClass : Codable {
    let id, userId: Int?
    let firstName, lastName, email: String?
    let roleId: Int
    let roleName, token: String?
    let schoolId: Int?
    let expiration: String?
}

struct logIn : Codable {
    let userName, password: String?
}
