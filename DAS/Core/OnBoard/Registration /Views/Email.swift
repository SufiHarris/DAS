//
//  EmailView.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 20/03/24.
//

import SwiftUI

struct EmailView: View {
    let email : String
    @State var showPasswordView : Bool = false
    var body: some View {
        VStack(alignment : .center) {
            Spacer()
            Image("EmailImage")
                .aspectRatio(contentMode: .fit)
//                .resizable()
//                .frame(width: 250 ,height: 200)
            Text("Check Your Email")
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding(.bottom , 10)
            Text("You'll find instructions in your email \(Text(email).foregroundStyle(.accent).fontWeight(.bold)) to establish your password")
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.gray)
            
            Spacer()
            Button(action: {}, label: {
                Text("Check Email")
                    .bold()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.accent)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding()
                
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showPasswordView) {
            Password()
        }

    }
}

#Preview {
    EmailView(email: "haris@gmail.com")
}
