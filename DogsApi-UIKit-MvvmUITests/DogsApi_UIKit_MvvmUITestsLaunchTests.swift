//
//  DogsApi_UIKit_MvvmUITestsLaunchTests.swift
//  DogsApi-UIKit-MvvmUITests
//
//  Created by İzmir İnovasyon ve Teknoloji on 17.12.2024.
//

import XCTest

final class DogsApi_UIKit_MvvmUITestsLaunchTests: XCTestCase {

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