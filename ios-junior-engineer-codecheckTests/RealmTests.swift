//
//  RealmTests.swift
//  ios-junior-engineer-codecheckTests
//
//  Created by Genki on 9/19/23.
//

import XCTest
@testable import ios_junior_engineer_codecheck

final class RealmTests: XCTestCase {
    let dataController = DataController()
    
    func testRealmItem() {
        let userName = "ゆめみん"
        let birthday = Date()
        let bloodType = "AB型"
        let todofuken = "富山県"
        let logoURL = "https://japan-map.com/wp-content/uploads/toyama.png"
        let createDate = Date()
        
        dataController.addRealmItem(userName: userName, birthday: birthday, bloodType: bloodType, todofuken: todofuken, logoURL: logoURL, createDate: createDate)
        
        let items = dataController.realmItems.first(where: { $0.createDate == createDate })!
        
        XCTAssertEqual(items.userName, userName)
        XCTAssertEqual(items.birthday, birthday)
        XCTAssertEqual(items.bloodType, bloodType)
        XCTAssertEqual(items.todofuken, todofuken)
        XCTAssertEqual(items.logoURL, logoURL)
    }
    
    func testRealmItemCount() {
        let nowCount = dataController.realmItems.count
        
        dataController.addRealmItem(userName: "ゆめみん", birthday: Date(), bloodType: "AB型", todofuken: "富山県", logoURL: "https://japan-map.com/wp-content/uploads/toyama.png", createDate: Date())
        
        XCTAssertEqual(dataController.realmItems.count, nowCount + 1)
    }
}

