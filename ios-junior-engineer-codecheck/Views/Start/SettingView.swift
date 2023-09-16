//
//  SettingView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/15/23.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var BGM = true
    @State private var soundEffect = true
    @State private var voice = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                Toggle("BGM", isOn: $BGM)
                    .padding(.top, 30)
                
                Toggle("効果音", isOn: $soundEffect)
                
                Toggle("音声", isOn: $voice)
                
                Spacer()
            }
            .font(.system(size: 20))
            .fontWeight(.medium)
            .padding(.horizontal, 40)
            .navigationBarTitle("設定", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                dismiss()
            }, label: {
                Text("OK")
            }))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
