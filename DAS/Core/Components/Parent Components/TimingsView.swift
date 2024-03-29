//
//  TimingsView.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 27/03/24.
//

import Foundation
import SwiftUI

//
//struct TimingsView: View {
//    let teacher: TeachersList
//    @State private var selectedTimeSlot: Timeslot?
//
//    var body: some View {
//        HStack {
//            if let timeSlots = teacher.timeslots {
//                ForEach(timeSlots, id: \.timeslotId) { data in
//                    timingContainer(time: data, isSelected: isSelected(timeslotId: data.timeslotId ?? 0))
//                        .background(selectedTimeSlot == data ? .accent : .white)
//                        .foregroundStyle(selectedTimeSlot == data ? .white : .black)
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
////                        .onTapGesture {
////                            if data.status == "Available" {
////                                selectedTimeSlot = data
////                            } else {
////                                selectedTimeSlot = nil
////                            }
////                        }
//                }
//            }
//        }
//    }
//
//    private func isSelected(timeslotId: Int) -> Bool {
//        return selectedTimeSlot?.timeslotId == timeslotId
//    }
//}
