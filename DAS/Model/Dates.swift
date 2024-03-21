//
//  Dates.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 26/03/24.
//

import Foundation

// MARK: - Welcome
struct Dates : Codable {
    let status: Int?
    let data: [DatesDetails]?
    let success, isValidationError: Bool?
    let totalCount: Int?
}

// MARK: - Datum
struct DatesDetails : Codable , Hashable {
    let ptmId: Int?
    let ptmDate: String?
    let meetingType: String?
}


