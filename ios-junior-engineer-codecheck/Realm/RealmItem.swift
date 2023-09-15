//
//  RealmItem.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/15/23.
//

import Foundation
import RealmSwift

class RealmItem: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: UUID = UUID()
    @Persisted var userName: String
    @Persisted var birthday: Date
    @Persisted var bloodType: String
    @Persisted var todofuken: String
    @Persisted var logoURL: String
    @Persisted var createDate: Date
    
}
