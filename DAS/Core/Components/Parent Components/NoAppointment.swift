//
//  NoAppointment.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 28/03/24.
//

import SwiftUI

struct NoAppointment: View {
    var body: some View {
   
        VStack(alignment: .center) {
            Image("noAppointment")
            Text("No appoinments found ")
            BookButton(title: "Book Appointment")      
        }
    }
}

#Preview {
    NoAppointment()
}
