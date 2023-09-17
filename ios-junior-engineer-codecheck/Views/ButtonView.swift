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
    var backColor: Color
    var body: some View {
        ZStack {
            Text("  ")
                .frame(minWidth: 150)
                .foregroundColor(.white)
                .font(.system(.title2, design: .rounded).bold())
                .padding()
                .background(RoundedRectangle(cornerRadius: 100).fill(backColor.opacity(1)))
                .padding(.top, 14)
            
            Text(text)
                .frame(minWidth: 150)
                .foregroundColor(.white)
                .font(.custom("Corporate-Logo-Rounded-Bold-ver3", size: 23))
                .font(.system(.title2, design: .rounded).bold())
                .padding()
                .background(RoundedRectangle(cornerRadius: 100).fill(color.opacity(1)))
            
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "テキスト", color: .blue, backColor: .yellow)
    }
}
