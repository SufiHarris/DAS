//
//  SideMenu.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 28/03/24.
//

import SwiftUI

struct labelStruct : Identifiable , Hashable{
    var id =  UUID()
    var name : String
    var logo : String
}

struct SideMenu: View {   
    @State private var selectedLabelName: String = (UserDefaults.standard.value(forKey: "selectedTab") as? String ?? "")

    @State private var isManageAppointments : Bool = false
    @State private var logoClicked : Bool = false
    @State private var isSupport : Bool = false
    @State private var isChangePassword : Bool = false
    @State private var signOutPressed : Bool = false
    
    @Binding var isShowing : Bool
    
    private let labelName : [labelStruct] = [
    labelStruct(name: "Manage appointments", logo: "list.bullet.clipboard.fill"),
    labelStruct(name: "Support", logo: "list.bullet.clipboard.fill"),
    labelStruct(name: "Change Password", logo: "list.bullet.clipboard.fill"),
    ]
    
    var body: some View {
        ZStack {
            
            if isShowing {
                Rectangle()
                    .opacity(0.3).ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    Spacer()
                    VStack {
                        SideMenuHeader()
                            .background(
                            LogoAnimation(animate: $logoClicked)
                            )
                            .onTapGesture {
                                logoClicked.toggle()
                            }
                        Divider()
                        
                        VStack (alignment : .leading ,spacing: 0) {
                            
                            ForEach(labelName)  { label in
                                MenuItemView(item: label, isSelected: label.name == selectedLabelName) {
                                                                   selectedLabelName = label.name
                                                                   // Perform additional actions if needed
                                                                   SelectPage(name: label.name)
                                                                   handleSelection(name: label.name)
                                                               }
                            }
                        }

                        .padding(.leading , 20)
                        .padding(.top , 40)
    
                        
                        
                        Spacer()
                        
                        Button(action: {
                            
                            signOut()
                            
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Log Out")
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: 60)
                            .background(.black.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding()
                            .foregroundStyle(.white)
                            .font(.headline)
                        })
                   

                    }
                    .frame(width: UIScreen.main.bounds.width / 1.3 ,alignment: .center)
                    .background(.white)
                }
            }
            
        }
        .navigationDestination(isPresented: $isManageAppointments) {
            BookAppointment()
        }
        .navigationDestination(isPresented: $signOutPressed) {
            LogIn()
        }
    }
}

#Preview {
    SideMenu(isShowing: .constant(true))
}

extension SideMenu {
    
    func SelectPage(name : String) {
        
        switch name {
        case "Manage appointments" :
            isManageAppointments = true
            return
        case "Change Password" :
            isChangePassword = true
            return
        default:
            isManageAppointments = false
        }
        
    }
    func signOut() {
        UserDefaults.standard.setValue(nil, forKey: "token")
        UserDefaults.standard.setValue(nil, forKey: "roleID")
        UserDefaults.standard.setValue(nil, forKey: "roleName")
        
        signOutPressed.toggle()
    }
    func handleSelection(name: String) {
        // Handle menu item selection based on name
        switch name {
        case "Manage appointments":
            isManageAppointments = true
            UserDefaults.standard.setValue("Manage appointments", forKey: "selectedTab")
        case "Support":
            isSupport = true
            UserDefaults.standard.setValue("Support", forKey: "selectedTab")

        case "Change Password":
            isChangePassword = true
            UserDefaults.standard.setValue("Change Password", forKey: "selectedTab")

        default:
            break
        }
    }
}
struct MenuItemView: View {
    var item: labelStruct
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: item.logo)
                Text(item.name)
                Spacer()
            }
            .font(.headline)
            .fontWeight(.light)
            .foregroundStyle(isSelected ? .accent : .black)
            .frame(maxWidth: .infinity)
            .padding()
            .background(isSelected ? Color.accentColor.opacity(0.2) : Color.clear)
            .cornerRadius(8)
            .padding(.trailing)
            //.padding(.vertical)
            
        }
        .contentShape(Rectangle())
        .padding(.vertical, 5)
    }
}
