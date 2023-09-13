//
//  DataController.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/13/23.
//

import SwiftUI

class DataController: ObservableObject {
    
    @Published var userName = ""
    @Published var birthDay = Date()
    @Published var bloodType = "A型"
    
}
