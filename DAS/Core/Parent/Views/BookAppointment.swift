//
//  BookAppointment.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 25/03/24.
//

import SwiftUI

struct selected {
    let tID : Int
    let selctedSlot : Timeslot
}

struct BookAppointment: View {
    @ObservedObject var vm : BookViewModel = BookViewModel()
    @State var ward : String = "Select Ward"
    @State  var date : String = "Select  date"
    @State var ptmId : String = ""
    @State var childId : String = ""
    @State var bgColor : Color = .white
    @State var showError : Bool = false
    @State private var selectedTimeSlots: [Int: Timeslot?] = [:]
    @State private var selectedTeacherID: Int?
    @State private var selectedTimeslotID: Int?
    @State var showSideMenu : Bool = false

    var body: some View {
    ZStack{
        VStack {
            Header(title: "Book Appointment", showSideMenu: $showSideMenu)
                .padding(.top , 0)
            BookButton(title: "Book")
                .padding(.leading ,  UIScreen.main.bounds.width / 2)
            HStack {
                Menu {
                    Picker(selection: $ward){
                        if let list = vm.wardList?.data {
                            ForEach(list, id: \.self) { data in
                                Text((data.firstName ?? "") + ((data.lastName ?? ""))).tag((data.firstName ?? "") + ((data.lastName ?? "")))
                            }
                        }
                        
                    } label: {
                        
                    }
                    .onChange(of: ward) { _ in
                        getDatesToSelect()
                    }
                } label: {
                    HStack (spacing : 20) {
                        Text("\(ward)")
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 5).stroke(.accent, lineWidth: 0.5)
                    }
                    
                }
                Spacer()
                
                Menu {
                    Picker(selection: $date) {
                        if let list = vm.datesList?.data {
                            ForEach(list, id: \.self) { data in
                                Text(data.ptmDate?.extractDateDetails() ?? "").tag(data.ptmDate ?? "")
                            }
                        }
                    }
                label: {
                    
                }   .onChange(of: date) { _ in
                    getDatesToSelect()
                }
                } label: {
                    HStack (spacing : 20) {
                        Text("\(date)")
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 5).stroke(.accent, lineWidth: 0.5)
                    }
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal , 20)
            
            
            //  guard let data = vm.timings?.data?[0].teachers_List else { return }
            
            Divider()
                .padding(.top , 20)
            
            HStack {
                
                Text("Choose meeting time for teacher")
                    .font(.callout)
                Spacer()
                HStack {
                    
                    Image(systemName: "chevron.down")
                    Text("Break Time")
                    
                }
                .font(.caption)
            }
            .padding(20)
            .fontWeight(.semibold)
            
            Divider()
            
            bookingView
            Spacer()
        }
        if showSideMenu {
            SideMenu(isShowing: $showSideMenu)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut(duration: 0.2))
        }
    }
        .alert(isPresented: $showError) {
            Alert(title: Text("No date found") ,message : Text("There is no PTM for this ward on this date.Please try to select a different date or ward.") ,dismissButton: .cancel())
                   }
  
    }
}


#Preview {
    BookAppointment()
}


extension BookAppointment {
    
    private func getDatesToSelect () {
               // Check if initial values have changed
               if ward != "Select Ward" && date != "Select date" {
                   // Check if both selections are valid
                       if let selectedChildId = vm.wardList?.data?.first(where: { data in
                           (data.firstName ?? "") + (data.lastName ?? "") == ward
                       })?.childId,
                          let selectedPtmId = vm.datesList?.data?.first(where: { data in
                              data.ptmDate == date
                          })?.ptmId {
                           childId = "\(selectedChildId)"
                           ptmId = "\(selectedPtmId)"
                           vm.getTimings(ptmId: ptmId, childId: childId)  { error in
                               if (error != nil) {
                                   showError.toggle()
                               }
                           
                           }
                       }
               }
           
    }
}


extension BookAppointment {
    private var bookingView : some View {
        HStack {
            VStack(alignment: .leading) {
                if let data = vm.timings?.data?[0].teachers_List {
                    ForEach(data , id : \.self) { teacher in
                        Text(teacher.teacherName ?? "")
                            .font(.subheadline)
                            .padding()
                        // .padding(.vertical)
                    }
                }
            }
            VStack {
                
                if let data = vm.timings?.data?[0].teachers_List {
                    ForEach(data , id : \.self) { teacher in
                        ScrollView(.horizontal){
                            HStack {
                                if let timeSlots = teacher.timeslots {
                                    ForEach(timeSlots ,id: \.self) { time in
                                        
                                        timingContainer(time: time)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


