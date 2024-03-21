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
    
    private let getAllAppointments = GetAppointmentService()
    private var cancellabels = Set<AnyCancellable>()
  //  @State var loader : Bool = true
    
    init() {
            self.getAllAppointments.getAppointments { [weak self] result  in
                switch result {
                case .success(let appointments) :
                    self?.appointments = appointments
              
                case.failure(let error ) :
                    self?.appointments = nil
                    print("error : \(error)")
                }
            }
        
    //    getAppointments()
    }
    
    func getAppointments() {
//            $appointments
//            //.debounce(for: 1.0, scheduler: DispatchQueue.main)
//            .receive(on: DispatchQueue.main) // Receive values on the main queue
//            .sink(receiveCompletion: { [weak self] completion in
//                switch completion {
//                case .finished:
//                    print("API request completed successfully")
//                case .failure(let error):
//                    print("Error fetching appointments:", error.localizedDescription)
//                }
//            }, receiveValue: { [weak self] appointments in
//                self?.appointments = appointments // Update appointments array
//            })
//            .store(in: &cancellabels)
           
    }
}
