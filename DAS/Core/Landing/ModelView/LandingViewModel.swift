//
//  LandingViewModel.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 21/03/24.
//

import Foundation


class LandingViewModel : ObservableObject  {
    
    let signInApi : String = "http://68.178.165.107:91/api/Account/Login"
    let email : String
    let password : String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        signIn()
    }
    
    private func signIn () {
        print("hiiii8")

        guard let url = URL(string: signInApi) else {
        fatalError("Errror in guard url sign in")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body : [String : String] = [
            "userName":  self.email,
            "password": self.password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else { fatalError("error while call on sign in : \(error)") }
            do {
                let response = try JSONSerialization.jsonObject(with: data , options: .allowFragments)
                print("SUCCESS : \(response)")
            }catch let error {
                print("Errror here  : \(error)")
            }
            print("hiiii")
        }
        task.resume()
    }
}
