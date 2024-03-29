//
//  Landing.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 20/03/24.
//

import SwiftUI

struct LogIn: View {
    @State var  languageSelected : String = "English"
    @State var userName : String = ""
    @State var password : String = ""
    @State var rememberMe : Bool = false
    @State var showRegister : Bool = false
    @State var showPasswordView : Bool  = false
    @State var showLandingView : Bool  = false
    var body: some View {
        ScrollView{
            VStack {
                languageView
                credentialsView
                Spacer()
                signinView
            }
            .navigationTitle("Welcome to DAS")
            .navigationDestination(isPresented: $showRegister) {
                Registration()
            }
            .navigationDestination(isPresented: $showPasswordView) {
                Password()
            }
            .navigationDestination(isPresented: $showLandingView) {
                AppointmentsView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        LogIn()
    }
}


// MARK: UI EXTENSION

extension LogIn {
    
   private var languageView : some View {
        HStack(alignment: .center , spacing: 20) {
            Text("English")
                .foregroundStyle(languageSelected == "English" ? .accent : .black)
                .font(.headline)
                .fontWeight(.regular)
                .padding()
                .padding(.horizontal , 35)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( languageSelected == "English" ? .accent  : .gray.opacity(0.5)  ,
                                lineWidth: languageSelected == "English" ?  3 : 2)
                }
                .background(languageSelected == "English" ? .accent.opacity(0.1) : .white)
                .onTapGesture {
                    languageSelected = "English"
                }
            Text("Arabic")
                .foregroundStyle(languageSelected == "Arabic" ? .accent : .black)
                .font(.headline)
                .fontWeight(.regular)
                .padding()
                .padding(.horizontal , 35)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( languageSelected == "Arabic" ?.accent  :  .gray.opacity(0.5) ,
                                lineWidth: languageSelected == "Arabic" ?  3 : 1)
                }
                .background(languageSelected == "Arabic" ? .accent.opacity(0.1) : .white)
                .onTapGesture {
                    languageSelected = "Arabic"
                }
        }
        .padding(.top, 30)
    }
    
    private var credentialsView : some View {
        VStack {
            
            VStack(alignment: .leading) {
                    Text("Username")
                    .font(.headline)
                    .bold()
                    
                TextField("Enter Username", text: $userName)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
            }
            .padding(.bottom, 15)
        
            VStack(alignment: .leading) {
                    Text("Password")
                    .font(.headline)
                    .bold()
                    
                TextField("Enter Password", text: $password)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
            }
            
            
            HStack {
                HStack {
                    Image(systemName: "checkmark.rectangle.fill")
                        .resizable()
                        .frame(width: 30, height: 25)
                        .foregroundStyle(rememberMe ? .accent : .gray)
                        .onTapGesture {
                            rememberMe.toggle()
                        }
                    Text("Remember this device")
                        .font(.callout)
                }
                
                Text("Forgot Password?")
                    .foregroundStyle(.accent)
                    .font(.callout)
                    .onTapGesture {
                        showPasswordView.toggle()
                    }
            }
            .padding(.top )
            
        }
        .padding(.horizontal)
        .padding(.top,30)
    }
    
    private var signinView : some View {
        VStack{
            Button(action: {
                LogInViewModel().signIn( email: userName, password: password) { success in
                    if success ==  true && UserDefaults.standard.value(forKey: "token") as?
                        String != ""{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            showLandingView.toggle()

                        }
                    }
                }
            }, label: {
                Text("Sign In")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
     
                    .padding()
                
            })
            HStack {
                Text("Haven't Registered Yet?")
                Text("Register").foregroundStyle(.accent).bold()
                    .onTapGesture {
                        showRegister.toggle()
                    }
            }

        }
    }
}
