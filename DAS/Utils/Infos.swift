//
//  Infos.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import SwiftUI
import Foundation


struct Infos {
     let token = UserDefaults.standard.value(forKey: "token")
     let roleId = UserDefaults.standard.value(forKey: "roleId")
     let roleName = UserDefaults.standard.value(forKey: "roleName")
}
