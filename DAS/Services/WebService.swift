//
//  WebService.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 21/03/24.
//

import Foundation

enum AuthError {
    case invalidCredentials
    case custom(errorMessage : String)
}


class WebService {
    
    
    func getToken(signInApi : String , email : String , password : String , completion : @escaping (SignIn) -> Void) {
        guard let url = URL(string: signInApi) else {
        fatalError("Errror in guard url sign in")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        let body : [String : String] = [
//            "userName":  email,
//            "password":  password
//        ]
        let body = logIn(userName:  email, password: password)
        request.httpBody = try? JSONEncoder().encode(body)

          let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else { fatalError("error while call on sign in : \(error)") }
            do {
               // let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let response = try JSONDecoder().decode(SignIn.self, from: data)
                print(response)
                completion(response)
            }catch let error {
                print("Errror here  : \(error)")
            }            
        }
        task.resume()
    }
}
