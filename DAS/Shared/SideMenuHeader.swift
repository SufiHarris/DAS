//
//  SideMenuHeader.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 28/03/24.
//

import SwiftUI

struct SideMenuHeader: View {
    var body: some View {
        HStack (alignment: .center) {
            Image("logoBig")
                .resizable()
                .frame(width: 150, height: 100)
                .scaledToFill()
                //.clipShape(Circle())
            
        }
    }
}

#Preview {
    SideMenuHeader()
}
