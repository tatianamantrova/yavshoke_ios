//
//  MainPageTests.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import XCTest
import Fakery

final class MainPageTests: XCTestCase {
    
    // MARK: - private prorerties
    
    private let app = XCUIApplication()
    private var faker = Faker()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    
    // MARK: - override functions
    
    override func setUp() {
        super.setUp()
        
        app.launch()
        mainPage.checkPageOpened()
    }
    
    // MARK: - tests

    @MainActor
    func testTypeEmailOnMainPage() throws {
        let email = faker.internet.email()
        
        mainPage
            .checkEmailFieldIsDisplayed()
            .typeEmail(email)
            .checkTypedEmail(email)
    }
    
    @MainActor
    func testShowInShockLabelOnMainPage() throws {
        let email = "testuser@domain.com"
        
        mainPage
            .checkEmailFieldIsDisplayed()
            .typeEmail(email)
            .checkTypedEmail(email)
            .checkCheckButtonIsDisplayed()
            .tapCheckButton()
            .checkSuccessLabelIsDisplayed()
    }
    
    @MainActor
    func testShowNotInShockLabelOnMainPage() throws {
        let email = faker.internet.email()
        
        mainPage
            .checkEmailFieldIsDisplayed()
            .typeEmail(email)
            .checkTypedEmail(email)
            .checkCheckButtonIsDisplayed()
            .tapCheckButton()
            .checkFailureLabelIsDisplayed()
    }
    
    @MainActor
    func testShowConfettiOnMainPage() throws {
        let email = "testuser@domain.com"
        
        mainPage
            .checkEmailFieldIsDisplayed()
            .typeEmail(email)
            .checkTypedEmail(email)
            .checkCheckButtonIsDisplayed()
            .tapCheckButton()
            .checkConfettiIsDisplayed()
    }
    
    @MainActor
    func testShowSuccessCatOnMainPage() throws {
        let email = "testuser@domain.com"
        
        mainPage
            .checkEmailFieldIsDisplayed()
            .typeEmail(email)
            .checkTypedEmail(email)
            .checkCheckButtonIsDisplayed()
            .tapCheckButton()
            .checkSuccessCatIsDisplayed()
    }
    
    @MainActor
    func testNavigateFromMainPageToLoginPage() throws {
        mainPage
            .checkPageOpened()
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        
        loginPage
            .checkPageOpened()
            .tapBackButton()
    }
}
