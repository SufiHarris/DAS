//
//  AppointmentCard.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI

struct AppointmentCard: View {
    
    let data : Datum
    @State var dropdownSelection : String = ""
    @State private var isPickerVisible = false

    var body: some View {
        VStack {
                 HStack {
                     Text(data.childName ?? "abc")
                         .font(.title3)
                     Spacer()
                     Menu {
                         Picker(selection: $dropdownSelection, label: Text("")) {
                             Text("Re - Schedule")
                                 .foregroundColor(.gray.opacity(0.5))
                                 .font(.subheadline)
                                 .tag("Re - Schedule")
                             Text("Cancel Appointment")
                                 .foregroundColor(.red)
                                 .tag("Cancel Appointment")
                         }
                         .pickerStyle(DefaultPickerStyle())
                     } label: {
                         Text("")
                         Image(systemName: "ellipsis")
                             .rotationEffect(Angle(degrees: 90))
                             .font(.title2)
                             .bold()
                             .foregroundColor(.gray)
                         Text("")
                     }
                 }
                 .padding(.vertical)
                
                HStack {
                    LogoText(icon: "calendar", text: data.ptmDate?.extractDateDetailsWithTime() ?? "")
                    Spacer()
                    Divider()
                        .bold()
                        .frame(height: 20)
                    Spacer()
                    LogoText(icon: "clock", text: "\(data.duration ??  "0") Min Each")
                    Spacer()
                    Divider()
                        .bold()
                        .frame(height: 20)
                    Spacer()
                    LogoText(icon: "video", text: data.isActve ?? false ? "Online" : "Offline")
                    
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
