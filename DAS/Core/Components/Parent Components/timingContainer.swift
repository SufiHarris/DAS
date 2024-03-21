//
//  timingContainer.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 27/03/24.
//

import SwiftUI

struct timingContainer: View {
    
    let time : Timeslot
    let isSelected : Bool
    var body: some View {
        HStack {
            Text(time.startTime ?? "")
            Text("-")
            Text(time.endTime ?? "")
        }
        .font(.caption)
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.accent , lineWidth: 0.5)
        }
    
    }
}

#Preview {
    timingContainer(time: Timeslot(timeslotId: 1, status: "Available", startTime: "8:00 am", endTime: "9:00 am", isOwn: false) , isSelected: false
    )
}
