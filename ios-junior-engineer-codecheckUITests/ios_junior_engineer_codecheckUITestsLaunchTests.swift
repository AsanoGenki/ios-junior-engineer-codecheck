//
//  ios_junior_engineer_codecheckUITestsLaunchTests.swift
//  ios-junior-engineer-codecheckUITests
//
//  Created by Genki on 9/18/23.
//

import XCTest

final class ios_junior_engineer_codecheckUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
