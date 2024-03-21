//
//  LogoText.swift
//  DAS
//
//  Created by Mohammad Haris Sofi on 22/03/24.
//

import SwiftUI

struct LogoText: View {
    let icon : String
    let text : String
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(text)
              
        }
        .font(.caption)
        .foregroundStyle(.gray)
    }
    
}

#Preview {
    LogoText(icon: "pencil.line", text: "pen")
}
