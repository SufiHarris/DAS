//
//  Registration.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 20/03/24.
//

import SwiftUI

struct Registration: View {
    
    @State var email  : String = ""
    @State var moveToLogin  : Bool = false
    @State var showAlert : Bool = false
    @State var alertType : ShortHands.emailErrors? = nil

    let shortHands = ShortHands()
    var body: some View {
        VStack {
         
            topView
            fieldView
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            buttonView
        }
        .navigationDestination(isPresented: $moveToLogin) {
            EmailView(email: email)
        }
        .navigationTitle("Registration")
    }

}

#Preview {
    NavigationStack {
        Registration()
    }
}











// MARK: UI EXTENSION
extension Registration  {
    
    var topView : some View {
        VStack(alignment : .leading) {
//            Text("Registration")
//                .font(.largeTitle)
//                .fontWeight(.semibold)
            Text("we will send an OTP verification to you")
                .font(.headline)
                .fontWeight(.light)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .padding(.horizontal ,20)
        .padding(.bottom , 60)
        }
        
        
    
    var fieldView : some View  {
        
        VStack(alignment : .leading) {
            Text("Enter Your Email")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.black.opacity(0.7))
            
            TextField("Enter your email", text: $email)
                .padding()
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray.opacity(0.2))
                        
                })
        }
        .padding(.horizontal ,20)
    }
    
    var buttonView : some View {
        Button(action: {
            
            onRegistrationClick()
            
        }, label: {
            Text("Register")
                 .font(.title3)
                 .bold()
                 .foregroundStyle(.white)
                 .frame(maxWidth: .infinity)
                 .frame(height: 50)
                 .background(.accent)
                 .clipShape(RoundedRectangle(cornerRadius: 5))
                 .padding()
        })
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
}







// MARK: FUNCTIONALITY EXTENSION

extension Registration {
    private func onRegistrationClick () {
      
        if email  == "" {
            alertType = ShortHands.emailErrors.emailNotFound
            showAlert.toggle()
//            getAlert()
        } else if email != "" {
            
            if shortHands.textFieldValidatorEmail(email) {
                moveToLogin.toggle()            }else {
                alertType = ShortHands.emailErrors.emailIsIncorrect
                showAlert.toggle()
            //    getAlert()
                }
        }
            
        }
        
    
    
    private func getAlert() -> Alert {
        switch alertType{
        case .emailNotFound :
           return Alert(title: Text("Email not found"),
                  message: Text(" Please enter an email , Thank you "),
                  primaryButton: .cancel(), secondaryButton: .default(Text("Ok")))
        case .emailIsShort :
            return Alert(title: Text("Email is short"),
                  message: Text(" Please enter an longer  email , Thank you "),
                  primaryButton: .cancel(), secondaryButton: .default(Text("Ok")))
            
            

        case .emailIsIncorrect :
            return  Alert(title: Text("Email is incorrect"),
                  message: Text("Please enter a valid email , Thank you "),
                  primaryButton: .cancel() , secondaryButton: .default(Text("Ok")))
            
    
        default :
            return  Alert(title: Text("Email not found"),
                  message: Text("OOPS :) Please enter an email , Thank you "),
                  primaryButton: .cancel(), secondaryButton: .default(Text("Ok")))
            
        }
    }
}


