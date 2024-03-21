//
//  BookViewModel.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import SwiftUI
import Foundation

class BookViewModel : ObservableObject {
    
    @Published var wardList : WardList?
    @Published var datesList : Dates?
    @Published var timings : Timings?
    private let vm : GetWardsList = GetWardsList()
    
    init() {
       // print("\(UserDefaults.standard.value(forKey: "roleID")) nahi hai yaha")
   
        getChildrenList()
        getDates()
        
    }
    
    func getChildrenList() {
        vm.getWardList { result in
            switch result {
            case .success(let wardList) :
                self.wardList = wardList
            case.failure(let error) :
                print("error \(error)")
            }
        }
    }
    func getDates() {
        
        vm.getDatesDetails { result in
            switch result {
            case .success(let dateList) :
                self.datesList = dateList
            case.failure(let error) :
                print("error \(error)")
            }

        }
    }
    
    
    func getTimings (ptmId: String, childId: String) {
        vm.getTimings(ptmId: ptmId, childId: childId) { result in
            switch result {
            case .success(let timings) :
                print(timings.data)
                self.timings = timings
                //self.datesList = dateList
            case.failure(let error) :
                print("error \(error)")
            }
        }
        
    }
}
