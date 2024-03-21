//
//  DASApp.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 21/03/24.
//
import SwiftUI

@main
struct DASApp: App {
    let vm = Infos()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if UserDefaults.standard.value(forKey: "token") as? String != nil {
                    Appoitments()
                }else {
                    LogIn()

                }
            }
            }
        }
    }
