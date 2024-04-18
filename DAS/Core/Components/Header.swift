//
//  Header.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI

struct Header: View {
    let title : String
    @Binding var showSideMenu : Bool
    var body: some View {
        
        VStack {
            HStack(alignment : .center) {
                Text(title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.medium)
                    .padding(.horizontal ,30)
                Spacer()
                Button(action: {
                    withAnimation (.linear(duration: 0.2)){
                        showSideMenu.toggle()
                    }
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 20 , height: 20)
                        .padding(.horizontal ,30)

                })
                
            }
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(.top, 20)

            Divider()
        }
        
    }
}

#Preview {
    Header(title: "Appoitments", showSideMenu: .constant(true))
}
