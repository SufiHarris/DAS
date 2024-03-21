//
//  AppointmentCard.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI

struct AppointmentCard: View {
    
    let data : Datum
    
    var body: some View {
        VStack {
            
            HStack {
                Text("\(data.childName)")
                    .font(.title3)
                    Spacer()
                Image(systemName: "ellipsis")
                    .rotationEffect(Angle(degrees: 90))
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.gray)
            }
            .padding(.vertical)
            
            HStack {
                LogoText(icon: "calendar", text: data.ptmDate)
                Spacer()
                Divider()
                    .bold()
                    .frame(height: 20)
                Spacer()
                LogoText(icon: "clock", text: "\(data.duration) Min Each")
                Spacer()
                Divider()
                    .bold()
                    .frame(height: 20)
                Spacer()
                LogoText(icon: "video", text: data.isActve ? "Online" : "Offline")
    
            }
            .padding(.bottom)
            
            Divider()
            
            AppointmentRow(data: data.timeslotDates ?? Dummy().timeLotDates)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        }
      //  .padding(.horizontal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
       
    }
}

#Preview {
    AppointmentCard(data: Dummy().appointmentDummy )
        .padding(.horizontal)
}
