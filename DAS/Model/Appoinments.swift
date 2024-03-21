//
//  Appoinments.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import Foundation


// MARK: - Welcome
struct Appoinments : Codable {
    let status: Int?
    let data: [Datum]?
    let success, isValidationError: Bool?
    let totalCount: Int?
}

// MARK: - Datum
struct Datum : Codable , Identifiable {
    let id: Int
    let meetingType: String
    let ptmID: Int?
    let ptmDate, duration, childName: String
    let isActve: Bool
    let childID: Int?
    let timeslotDates: [TimeslotDate]?
}

// MARK: - TimeslotDate
struct TimeslotDate : Codable , Hashable {
    let timeslotID: Int?
    let status: String
    let startTime, endTime: String
    let teacherName: String
    let isActive: Bool
    let joinURL: String?
    let location: String
}

enum Status: String ,Codable {
    case missed
    case upcoming
}

