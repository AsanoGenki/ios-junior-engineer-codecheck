//
//  ios_junior_engineer_codecheckApp.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

@main
struct ios_junior_engineer_codecheckApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    @ObservedObject var dataController = DataController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        dataController.playBGM()
        
        return true
    }
}
