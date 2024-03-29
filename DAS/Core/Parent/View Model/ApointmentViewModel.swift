//
//  ApointmentViewModel.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//
import Foundation
import SwiftUI
import Combine

class ApointmentViewModel : ObservableObject {
    @Published var appointments: Appoinments?
    var cancellables  = Set<AnyCancellable>()
    private let getAllAppointments = GetAppointmentService()
    private var cancellabels = Set<AnyCancellable>()
    @State var isLoading : Bool = false    
    init() {
       getAppointments()
    }
    
    func getAppointments() {
        getAllAppointments.$appointments
            .sink {[weak self] (value) in
                self?.appointments = value
                self?.isLoading.toggle()
            }
            .store(in: &cancellabels)
    }
        

           
    
}
