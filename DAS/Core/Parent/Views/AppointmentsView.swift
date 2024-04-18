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
    @State var showSideMenu = false
    
    var body: some View {
        ZStack{
            VStack {
                Header(title: "Appointments", showSideMenu: $showSideMenu)
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
//                        VStack {
//                            Image("noAppointment")
//                            Text("No Appointment Found ")
//                                .bold()
//                            .foregroundStyle(Color.accentColor)                        }
                        Spacer()
                    }
                }
            }
            if showSideMenu {
                SideMenu(isShowing: $showSideMenu)
                    .transition(.move(edge: .trailing))
                    .animation(.easeInOut(duration: 0.2))
            }
        }
        .navigationBarBackButtonHidden(true)
   
        .navigationDestination(isPresented: $isBookAppointmentShown) {
            DAS.BookAppointment()
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
            
            }
        }
    }
      
}

