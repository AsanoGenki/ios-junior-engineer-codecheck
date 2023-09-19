//
//  AssetTests.swift
//  ios-junior-engineer-codecheckTests
//
//  Created by Genki on 9/19/23.
//

import XCTest
@testable import ios_junior_engineer_codecheck

final class AssetTests: XCTestCase {
    
    //コードが期待するすべての色がアセットカタログに含まれていることを確認する
    func testColorsExsists() {
        let allColors = ["backgroundColor", "costomCyan", "costomYellow"]

        for color in allColors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }
    
    //コードが期待するすべての音声ファイルがアセットカタログに含まれていることを確認する
    func testAudioExsists() {
        let allAudio = ["BGM_Sweet_Peach", "SE_click_normal", "SE_click_small"]
        
        for audio in allAudio {
            XCTAssertNotNil(audio, "Failed to load audio '\(audio)' from asset catalog.")
        }
    }
}
