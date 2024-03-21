//
//  BookButton.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI

struct BookButton: View {
    let title : String
    var body: some View {
      
        VStack (){
            Text(title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 180 ,height: 50)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing)
                .padding(.vertical ,10)
        }
       // .frame(maxWidth: .infinity ,alignment: .trailing)
    }
}

#Preview {
    BookButton(title: "Button")
}
