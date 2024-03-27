//
//  Password.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 21/03/24.
//

import SwiftUI

struct Password: View {
    
    @State var password : String = ""
    @State var showHome : Bool = false
    
    var body: some View {
        VStack {
            confirmPasswordView
    
            Spacer()
            signinView
        }
        .navigationTitle("Create New Password")
        .navigationDestination(isPresented: $showHome) {
            Registration()
        }
    }
}

#Preview {
    Password()
}

extension Password {

     
     private var confirmPasswordView : some View {
         VStack {
             
             VStack(alignment: .leading) {
                     Text("New Password")
                     .font(.headline)
                     .bold()
                     
                 TextField("Enter Password", text: $password)
                     .padding()
                     .overlay {
                         RoundedRectangle(cornerRadius: 3)
                             .stroke(.gray.opacity(0.5), lineWidth: 1)
                     }
             }
             .padding(.bottom, 15)
         
             VStack(alignment: .leading) {
                     Text("Re-Enter NewPassword")
                     .font(.headline)
                     .bold()
                     
                 TextField("Enter Password", text: $password)
                     .padding()
                     .overlay {
                         RoundedRectangle(cornerRadius: 3)
                             .stroke(.gray.opacity(0.5), lineWidth: 1)
                     }
             }
         }
         .padding(.horizontal)
         .padding(.top,30)
     }
     
     private var signinView : some View {
         VStack{
             Button(action: {}, label: {
                 Text("Set Password")
                     .foregroundStyle(.white)
                     .frame(maxWidth: .infinity)
                     .frame(height: 60)
                     .background(.accent)
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                     .padding()
                 
             })
         }
     }
}
