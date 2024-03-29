//
//  Landing.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI
struct AppointmentsView: View {
    @StateObject private var vm =  ApointmentViewModel()
    @State private var isBookAppointmentShown = false
    
    var body: some View {
        VStack {
           Header(title: "Appointments")
            BookButton(title: "Book Appointment")
                .padding(.leading, UIScreen.main.bounds.width - 200)
                .onTapGesture {
                    isBookAppointmentShown.toggle()
                }
            
            if vm.isLoading {
                // Show progress view while data is loading
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                if let data = vm.appointments?.data {
                    if data.isEmpty {
                        // Show empty state view
                        VStack {
                            Divider()
                            Spacer()
                          NoAppointment()
                            .padding(.bottom, UIScreen.main.bounds.height / 4)
                        }
                    } else {
                        // Show appointments data
                        ScrollView {
                            LazyVStack {
                                ForEach(data) { appointment in
                                    AppointmentCard(data: appointment)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                } else {
                    // Show error view
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
   
        .navigationDestination(isPresented: $isBookAppointmentShown) {
            DAS.BookAppointment()
        }
   
    }
      
}
//
//extension Appoinments {
//    
//     var noDataView : some View {
//    }
//    
//}
