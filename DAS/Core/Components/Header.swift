//
//  Header.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI

struct Header: View {
    let title : String
    var body: some View {
        
        VStack(alignment : .leading) {
            Text(title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.medium)
                .padding(.horizontal ,30)
                .padding(.top, 20)
            Divider()
        }
        .frame(maxWidth: .infinity ,alignment: .leading)
        
    }
}

#Preview {
    Header(title: "Appoitments")
}
