//
//  Timings.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 26/03/24.
//

import Foundation

// MARK: - Welcome
struct Timings : Codable , Hashable {
    let status: Int?
    let data: [TimingsDetail]?
    let success, isValidationError: Bool?
    let totalCount: Int?
}

// MARK: - Datum
struct TimingsDetail: Codable , Hashable {
    let ptM_Id: Int?
    let ptM_Date, slot_Duration, ptM_StartTime, ptM_EndTime: String?
    let teachers_List: [TeachersList]?
}

// MARK: - TeachersList
struct TeachersList : Codable , Hashable {
    let teacherId: Int?
    let teacherName: String?
    let locationId: Int?
    let teacherLocation: String?
    let ptmId: Int?
    let timeslots: [Timeslot]?
}

// MARK: - Timeslot
struct Timeslot : Codable , Hashable {
    let timeslotId: Int?
    let status: String?
    let startTime, endTime: String?
    let isOwn: Bool?
}


