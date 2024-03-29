//
//  ApointmentViewModel.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//
import Foundation
import SwiftUI
import Combine

class GetAppointmentService : ObservableObject {
    
    @Published var appointments: Appoinments?
    private var appointmentsSubscription: AnyCancellable?
    private var service : Service = Service()
    var cancellables = Set<AnyCancellable>()
    init() {
         self.getAppointments()
    }
    
    func getAppointments() {
        guard let url = URL(string: "http://68.178.165.107:91/api/Appointment/GetAllAppointmentByParentId") else {
            fatalError("URL for appointments is incorrect")
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(Infos().token ?? "")", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Appoinments.self, decoder: JSONDecoder())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    // Handle successful completion
                    print()
                    break
                case .failure(let error):
                    // Handle failure
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: {[weak self] value in
                // Handle received value
                self?.appointments = value
            })
            .store(in: &cancellables) // Make sure to hold cancellables in your class or struct
    }
}
