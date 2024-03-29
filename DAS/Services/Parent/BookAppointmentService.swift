//
//  GetWardsList.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import Foundation
import Combine

class BookAppointmentService : ObservableObject {
    
    @Published var wardList : WardList?
    @Published var datesList :  Dates?
    @Published var timings : Timings?
    var wardsSubscription : AnyCancellable?
    var datesSubscription : AnyCancellable?
    
    init() {
        getWardList()
        getDatesDetails()
    }
    
    func getWardList() {
        guard let getWardUrl = URL(string: "http://68.178.165.107:91/api/Parent/GetAllChildrensByParentId?parentId=\(UserDefaults.standard.value(forKey: "roleID") ?? "")") else {
            fatalError("URL for appointments is incorrect")
        }
        var request = URLRequest(url: getWardUrl)
        request.setValue("Bearer \(Infos().token ?? "")", forHTTPHeaderField: "Authorization")
        wardsSubscription = Service.download(url: request)
            .decode(type: WardList.self, decoder: JSONDecoder())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion:
                    Service.handleCompletion, receiveValue: {[weak self] (returnedData) in
                self?.wardList = returnedData
                self?.wardsSubscription?.cancel()
            })}
    
    func getDatesDetails() {
        guard let getWardUrl = URL(string: "http://68.178.165.107:91/api/PTM/GetAllPtmsDates") else {
            fatalError("URL for appointments is incorrect")
        }
        var request = URLRequest(url: getWardUrl)
        request.setValue("Bearer \(Infos().token ?? "")", forHTTPHeaderField: "Authorization")
        datesSubscription = Service.download(url: request)
            .decode(type: Dates.self, decoder: JSONDecoder())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion:
                    Service.handleCompletion, receiveValue: {[weak self] (returnedData) in
                self?.datesList = returnedData
                self?.datesSubscription?.cancel()
            })}
    
    func getTimings ( ptmId : String , childId : String , completion: @escaping (Result<Timings, Error>) -> Void ) {
        guard let getWardUrl = URL(string: "http://68.178.165.107:91/api/PTM/GetPtmDetailsByChildId?PtmId=\(ptmId)&ChildId=\(childId)") else {
            fatalError("URL for appointments is incorrect")
        }
        Service().download(url: getWardUrl) { result in
            switch result {
            case .success(let data) :
                do {
                    // Decode JSON data into Appointments model
                    let decodedData = try JSONDecoder().decode(Timings.self, from: data)
                    self.timings = decodedData
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
}
