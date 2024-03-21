//
//  Landing.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI

struct Appoitments: View {
    
    @ObservedObject  private  var vm = ApointmentViewModel()
    @State private var BookAppointment : Bool = false
    var body: some View {
        VStack {
            Header(title: "Appointments")
            BookButton(title: "Book Appointment")
                .padding(.leading  , UIScreen.main.bounds.width - 200)
                .onTapGesture {
                    BookAppointment.toggle()
                }
            if let data =  vm.appointments?.data?.count ,
               data < 1 
            {
                VStack {
                    Divider()
                    Spacer()
                    VStack {
                        Image("noAppointment")
                        Text("No Upcoming appointments found.")
                        BookButton(title: "Book Appointment")
                        // .frame(maxWidth: .infinity ,alignment: .center)
                    }
                    .padding(.bottom , UIScreen.main.bounds.height / 4)
                }
                
            }else {
                if let data =  vm.appointments?.data {
                    ScrollView {
                        LazyVStack {
                            ForEach(data) { appoint in
                                AppointmentCard(data: appoint)
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    //                if let data =  vm.appointments?.data {
                    //                       ScrollView {
                    //                           LazyVStack {
                    //                               ForEach(data) { appoint in
                    //                                   AppointmentCard(data: appoint)
                    //                               }
                    //                               .padding(.horizontal)
                    //                           }
                    //                    }
                    //                }else {
                    //                    VStack {
                    //                        ProgressView()
                    //                    }
                    //                    .frame(maxWidth: .infinity)
                    //                    .frame(height: UIScreen.main.bounds.height / 1.5)
                    //                }
                    //            }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $BookAppointment) {
            DAS.BookAppointment()
        }
    }
    
}
#Preview {
    Appoitments()
}
//
//extension Appoinments {
//    
//     var noDataView : some View {
//    }
//    
//}
