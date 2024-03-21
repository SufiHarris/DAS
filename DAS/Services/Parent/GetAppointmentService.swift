//
//  ApointmentViewModel.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//
import Foundation
import SwiftUI
import Combine

class GetAppointmentService {
    
    @Published var appointments: Appoinments?
    private var appointmentsSubscription: AnyCancellable?
    private var service : Service = Service()
    init() {
       // self.getAppointments()
    }
    func getAppointments(completion: @escaping (Result<Appoinments, Error>) -> Void) {
                
        guard let url = URL(string: "http://68.178.165.107:91/api/Appointment/GetAllAppointmentByParentId") else {
            fatalError("URL for appointments is incorrect")
        }
        Service().download(url: url) { result in
            switch result {
            case .success(let data ) :
                do {
                    // Decode JSON data into Appointments model
                    let decodedData = try JSONDecoder().decode(Appoinments.self, from: data)
                    self.appointments = decodedData // Assuming 'appointments' is a property to store the decoded data
                    //print(decodedData)
                    completion(.success(decodedData))
                } catch {
                    // Handle decoding errors
                    completion(.failure(error))
                }
            case .failure(let error) :
                completion(.failure(error))
            }
        }
        }
        
    //MARK: Extras
    
    //func getAppointments() {
//        guard let url = URL(string: "http://68.178.165.107:91/api/Appointment/GetAllAppointmentByParentId") else {
//            fatalError("URL for appointments is incorrect")
//        }
//        
//        // Create a URLRequest with headers and token if needed
//        var request = URLRequest(url: url)
//        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
//        // Add other headers if required
//        
//        appointmentsSubscription = URLSession.shared.dataTaskPublisher(for: request)
//            .map(\.data) // Extract data from the response
//            .decode(type: Appoinments.self, decoder: JSONDecoder()) // Decode JSON data into Appointments object
//            .receive(on: DispatchQueue.main) // Receive on the main queue to update UI
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    print("API request completed successfully")
//                case .failure(let error):
//                    print("Error:", error.localizedDescription)
//                    // Handle decoding error
//                    if let decodingError = error as? DecodingError {
//                        print("Decoding error:", decodingError)
//                        // Handle decoding error further if needed
//                    }
//                }
//            }, receiveValue: { [weak self] appointments in
//       
//                    self?.appointments = appointments
//                    print(appointments)
//                    self?.appointmentsSubscription?.cancel()
//            })
        

  //  }
        
//        var request = URLRequest(url: url)
//        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
//        // Add other headers if required
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            // Check for network errors
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            // Check HTTP response status codes
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
//                let errorMessage = "Failed to fetch appointments. Status code: \(statusCode)"
//                let error = NSError(domain: "App", code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
//                completion(.failure(error))
//                return
//            }
//            
//            // Check if data is available
//            guard let data = data else {
//                let error = NSError(domain: "App", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
//                completion(.failure(error))
//                return
//            }
            
           
    

}
