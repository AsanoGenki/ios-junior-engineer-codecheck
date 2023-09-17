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
            .font(.custom("Corporate-Logo-Rounded-Bold-ver3", size: 20))
            .padding(.horizontal, 40)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                dismiss()
            }, label: {
                Text("OK")
                    .font(.custom("Corporate-Logo-Rounded-Bold-ver3", size: 18))
            }))
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("設定")
                        .font(.custom("Corporate-Logo-Rounded-Bold-ver3", size: 18))
                }
            }
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
