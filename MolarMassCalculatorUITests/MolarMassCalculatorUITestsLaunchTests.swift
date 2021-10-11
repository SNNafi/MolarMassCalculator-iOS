//
//  MolarMassCalculatorUITestsLaunchTests.swift
//  MolarMassCalculatorUITests
//
//  Created by Shahriar Nasim Nafi on 10/10/21.
//  Copyright © 2021 Shahriar Nasim Nafi. All rights reserved.
//

import XCTest

class MolarMassCalculatorUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
