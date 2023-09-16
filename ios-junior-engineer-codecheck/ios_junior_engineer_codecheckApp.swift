//
//  ios_junior_engineer_codecheckApp.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

@main
struct ios_junior_engineer_codecheckApp: App {
    
    @StateObject var bgmPlayerManager = BGMPlayerManager.shared
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(bgmPlayerManager)
        }
    }
}
