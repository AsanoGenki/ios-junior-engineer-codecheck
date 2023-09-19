//
//  RealmModel.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/15/23.
//

import Foundation
import RealmSwift

class RealmModel: ObservableObject {
    var config: Realm.Configuration
    
    init() {
        config = Realm.Configuration()
    }
    
    var realm: Realm {
        return try! Realm(configuration: config)
    }
    
    // 保存されている RealmItem を Results<RealmItem> として返す
    var items: Results<RealmItem> {
        realm.objects(RealmItem.self)
    }
    
    // 保存するデータ を受け取り、新規 RealmItem を作成・登録する
    func addRealmItem(userName: String, birthday: Date, bloodType: String, todofuken: String, logoURL: String, createDate: Date) {
        let item = RealmItem()
        item.id = UUID()
        item.userName = userName
        item.birthday = birthday
        item.bloodType = bloodType
        item.todofuken = todofuken
        item.logoURL = logoURL
        item.createDate = createDate
        try! realm.write {
            realm.add(item)
        }
    }
}
