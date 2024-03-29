//
//  BookViewModel.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import SwiftUI
import Foundation
import Combine

class BookViewModel : ObservableObject {
    
    @Published var wardList : WardList?
    @Published var datesList : Dates?
    @Published var timings : Timings?
    private let vm : BookAppointmentService = BookAppointmentService()
    var cancellabels = Set<AnyCancellable>()
    init() {
        getData()
    }
    func getData() {
        vm.$wardList
            .combineLatest(vm.$datesList)
            .sink {[weak self] (wardList, datesList) in
                self?.wardList = wardList
                self?.datesList = datesList
            }
            .store(in: &cancellabels)
    }
    func getTimings(ptmId: String, childId: String, completion: @escaping (Error?) -> Void) {
        vm.getTimings(ptmId: ptmId, childId: childId) { result in
            switch result {
            case .success(let data):
                self.timings = data
                completion(nil) // No error, so pass nil
            case .failure(let error):
                completion(error) // Pass the received error
            }
        }
    }

}
