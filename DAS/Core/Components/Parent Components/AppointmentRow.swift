//
//  AppointmentRow.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import SwiftUI

struct AppointmentRow: View {
    
   let data : [TimeslotDate]
    let maxVisibleAppointments = 3 // Maximum appointments initially visible

    @State var showMore : Bool = false
    var body: some View {
        VStack(spacing: 10) {
               ScrollView(.vertical, showsIndicators: false) {
                   LazyVStack(spacing: 10) {
                       ForEach(data.prefix(showMore ? data.count : maxVisibleAppointments), id: \.self) { timeSlot in
                           HStack(alignment: .top, spacing: UIScreen.main.bounds.width / 10) {
                               Text(timeSlot.startTime)
                                   .font(.subheadline)
                                   //.frame(width: UIScreen.main.bounds.width / 4, alignment: .leading)
                               
                               VStack(alignment: .leading) {
                                   Text(timeSlot.teacherName)
                                       .font(.footnote)
                                   Text(timeSlot.status)
                                       .foregroundStyle(.white)
                                       .font(.caption2)
                                       .padding(6)
                                       .background(statusColor(for: timeSlot.status))
                                       .clipShape(RoundedRectangle(cornerRadius: 10))
                                       .lineLimit(1)
                               }
                               .frame(width: UIScreen.main.bounds.width / 4, alignment: .leading)
                               
                               Image(systemName: "video.fill")
                                   .foregroundColor(.gray.opacity(0.5))
                                   .padding(20)
                                   .background(.gray.opacity(0.1))
                                   .clipShape(RoundedRectangle(cornerRadius: 5))
                           }
                       }
                   }
               }
               Divider()
                .frame(maxWidth: UIScreen.main.bounds.width)
               if data.count > maxVisibleAppointments {
                   Button(action: {
                       withAnimation(.easeOut) {
                           showMore.toggle()
                       }
                   }) {
                       Text(showMore ? "View Less \(Image(systemName: "chevron.up"))" :
                                "View More \(Image(systemName: "chevron.down"))")
                           .font(.body)
                           .foregroundStyle(.black)
                           .padding(.vertical,5)
                           .frame(maxWidth: .infinity)
                   }
               }
           }
    }
}

#Preview {
    AppointmentRow(data: Dummy().timeLotDates)
}

extension AppointmentRow {
    
    private func statusColor(for status: String) -> Color {
           switch status {
           case "Upcoming":
               return Color.yellow
           case "Concluded":
               return Color.blue
           case "Missed" :
               return Color.gray.opacity(0.5)
           default:
               return Color.green
           }
       }
    
}
