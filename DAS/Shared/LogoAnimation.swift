//
//  LogoAnimation.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 17/04/24.
//

import SwiftUI

struct LogoAnimation: View {
    @Binding var animate : Bool
    var body: some View {
       
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none , value:  animate)
    }
}

#Preview {
    LogoAnimation(animate: .constant(false))
}
