//
//  StartView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("都道府県")
                    .font(.system(size: 54))
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                Text("相性占い")
                    .font(.system(size: 54))
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                
                Image("nihonchizu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .padding(.top, 20)
                
                NavigationLink {
                    InputView()
                } label: {
                    ButtonView(text: "はじめる", color: .blue)
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
