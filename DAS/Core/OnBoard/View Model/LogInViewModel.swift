//
//  LogInViewModel.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 21/03/24.
//

import Foundation


struct LogInViewModel{
    
    let signInApi : String = "http://68.178.165.107:91/api/Account/Login"
    let email : String = ""
    let password : String = ""
    private let loggedIn  : Bool = false
    
    func signIn (signInApi : String = "http://68.178.165.107:91/api/Account/Login" , email: String, password: String , completion : @escaping (Bool) -> Void) {
        WebService().getToken(signInApi: signInApi, email: email, password: password) { data in

            guard let data = data.data else {
                completion(false)
                return
            }
            UserDefaults.standard.setValue(data.token, forKey: "token")
            UserDefaults.standard.setValue(data.id
                                           , forKey: "roleID")
            UserDefaults.standard.setValue(data.roleName, forKey: "roleName")
            completion(true)
        }
    }
}
