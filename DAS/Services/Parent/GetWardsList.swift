//
//  GetWardsList.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import Foundation

class GetWardsList : Observable {
    
    @Published var wardList : WardList?
    @Published var datesList :  Dates?
    @Published var timings : Timings?
    
    func getWardList(completion: @escaping (Result<WardList, Error>) -> Void) {
        guard let getWardUrl = URL(string: "http://68.178.165.107:91/api/Parent/GetAllChildrensByParentId?parentId=\(UserDefaults.standard.value(forKey: "roleID") ?? "")") else {
            fatalError("URL for appointments is incorrect")
        }
        print(getWardUrl)

        Service().download(url: getWardUrl) { result in
            switch result {
            case .success(let data ) :
                do {
                    // Decode JSON data into Appointments model
                    let decodedData = try JSONDecoder().decode(WardList.self, from: data)
                    self.wardList = decodedData
                    print(decodedData)
                    completion(.success(decodedData))
                } catch {
                    // Handle decoding errors
                    completion(.failure(error))
                }
            case.failure(let error) :
                completion(.failure(error))
            }
            
            
          
        }
        }
    
    func getDatesDetails( completion: @escaping (Result<Dates, Error>) -> Void ) {
    
        
        guard let getWardUrl = URL(string: "http://68.178.165.107:91/api/PTM/GetAllPtmsDates") else {
            fatalError("URL for appointments is incorrect")
        }
        Service().download(url: getWardUrl) { 
            result in
            
            switch result {
            case .success(let data ) :
                do {
                    // Decode JSON data into Appointments model
                    let decodedData = try JSONDecoder().decode(Dates.self, from: data)
                    self.datesList = decodedData
                   // print(decodedData)
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
                    print("hello")
                    // print(decodedData)
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
