//
//  ios_junior_engineer_codecheckUITests.swift
//  ios-junior-engineer-codecheckUITests
//
//  Created by Genki on 9/18/23.
//

import XCTest

final class ios_junior_engineer_codecheckUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }

    //スタート画面のテスト
    func testStartView() throws {
        XCTAssertTrue(app.images["nihonchizuImage"].exists)
        XCTAssertTrue(app.buttons["startButton"].exists)
        XCTAssertTrue(app.navigationBars.buttons.element(boundBy: 0).exists)
        XCTAssertTrue(app.navigationBars.buttons.element(boundBy: 1).exists)
    }
    
    //設定画面のテスト
    func testSettingView() throws {
        let bgmToggle = app.switches["BGM"]
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        let isToggleOn = bgmToggle.value as? String == "1"
        
        if !isToggleOn {
            bgmToggle.switches.firstMatch.tap()
        }
        
        XCTAssertEqual(bgmToggle.value as! String, "1")
        
        app.buttons["closeSettingView"].tap()
    }
    
    //"はじめる"ボタンのテスト
    func testStartButton() throws {
        let startButton = app.buttons["startButton"]
        XCTAssertTrue(startButton.isEnabled)
        
        startButton.tap()
        
        XCTAssertTrue(app.staticTexts["あなたについて教えてください"].exists)
        
    }
    
    //"占う"ボタンのテスト
    func testReadFortuneButton() throws {
        let readFortuneButton = app.buttons["readFortuneButton"]
        let nameTextField = app.textFields["nameTextField"]
        let loadingText = app.staticTexts["探索中"]
        let resultText = app.staticTexts["相性が良い都道府県は..."]
        
        app.buttons["startButton"].tap()
        
        XCTAssertFalse(readFortuneButton.isEnabled)
        
        nameTextField.tap()
        nameTextField.typeText("自動でテキストフィールドに入力します。")
        nameTextField.typeText("\n")

        
        XCTAssertTrue(readFortuneButton.isEnabled)
        
        readFortuneButton.tap()
        
        XCTAssertTrue(loadingText.exists)
        
        sleep(4)
        
        XCTAssertTrue(resultText.exists)
        
    }
    
    //結果画面のテスト
    func testResultView() throws {
        let nameTextField = app.textFields["nameTextField"]
        let briefText = app.staticTexts["brief"]
        let backHomeButton = app.buttons["backHomeButton"]
        
        app.buttons["startButton"].tap()
        
        nameTextField.tap()
        nameTextField.typeText("自動でテキストフィールドに入力します。")
        nameTextField.typeText("\n")
        
        app.buttons["readFortuneButton"].tap()
        
        sleep(4)
        
        app.staticTexts["特徴"].tap()
        
        XCTAssertTrue(briefText.exists)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        while !backHomeButton.exists {
            app.swipeUp()
        }
        
        app.buttons["backHomeButton"].tap()
        
        XCTAssertTrue(app.staticTexts["Title"].exists)
    }
}
