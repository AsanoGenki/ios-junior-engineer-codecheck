//
//  SettingView.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/15/23.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var bgmPlayerManager: BGMPlayerManager
    
    @AppStorage("soundEffect") var isPlayingSE = true
    @AppStorage("voice") var isPlayingVoice = true
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                
                Toggle("BGM", isOn: $bgmPlayerManager.isPlayingBGM)
                    .padding(.top, 30)
                
                Toggle("効果音", isOn: $isPlayingSE)
                
                Toggle("音声", isOn: $isPlayingVoice)
                
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
