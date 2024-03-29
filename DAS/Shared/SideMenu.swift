//
//  SideMenu.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 28/03/24.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isShowing : Bool
    var body: some View {
        ZStack {
            
            if isShowing {
                Rectangle()
                    .opacity(0.3).ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment : .leading) {
                        SideMenuHeader()
                        Spacer()
                        
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.3 ,alignment: .leading)
                    .background(.white)
                    Spacer()
                }
            }
            
        }
    }
}

#Preview {
    SideMenu(isShowing: .constant(true))
}
