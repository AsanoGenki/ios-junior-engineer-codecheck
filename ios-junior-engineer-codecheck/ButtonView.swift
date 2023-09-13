//
//  ButtonView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var color: Color
    var body: some View {
        Text(text)
            .frame(minWidth: 150)
            .foregroundColor(.white)
            .font(.system(.title2, design: .rounded).bold())
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(color.opacity(0.8)))
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "テキスト", color: .blue)
    }
}
