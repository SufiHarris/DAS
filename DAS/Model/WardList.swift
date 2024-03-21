//
//  WardList.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import Foundation


// MARK: - Welcome
struct WardList  : Codable{
    let status: Int?
    let data: [Ward]?
    let success, isValidationError: Bool?
    let messages: [String]?
    let totalCount: Int?
}

// MARK: - Datum
struct Ward : Codable ,Hashable {
    let firstName, lastName: String?
    let childId: Int?
    let isActive: Bool?
    let childCount: Int?
}
