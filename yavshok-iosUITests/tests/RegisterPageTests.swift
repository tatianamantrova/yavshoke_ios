//
//  RegisterPageTests.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import XCTest
import Fakery

final class RegisterPageTests: XCTestCase {
    
    // MARK: - prorerties
    
    private let app = XCUIApplication()
    private var faker = Faker()
    
    // MARK: - lazy prorerties
    
    private lazy var loginPage = LoginPage(app: app)
    private lazy var mainPage = MainPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
    
    override func setUp() {
        super.setUp()
        
        app.launch()
        
        mainPage
            .checkPageOpened()
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        
        loginPage
            .checkPageOpened()
            .checkRegisterButtonIsDisplayed()
            .tapRegisterButton()
        
        registerPage.checkPageOpened()
    }
    
    // MARK: - tests

    @MainActor
    func testSuccessRegisterUser() throws {
        registerPage
            .checkEmailFieldIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .checkAgeFieldIsDisplayed()
            .typeEmail(faker.internet.email())
            .typePassword("123456")
            .typeAge(25)
            .tapRegisterButton()
        
        profilePage
            .checkPageOpened()
            .tapLogoutButton()
    }
    
    @MainActor
    func testShowPlaceholdersOnMainPage() throws {
        registerPage
            .checkEmailFieldIsDisplayed()
            .checkEmailPlaceholderIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .checkPasswordPlaceholderIsDisplayed()
            .checkAgeFieldIsDisplayed()
            .checkAgePlaceholderIsDisplayed()
        
        registerPage.tapBackButton()
        
        loginPage.tapBackButton()
    }
    
    @MainActor
    func testNavigateFromRegisterPageToLoginPage() throws {
        registerPage
            .checkBackButtonIsDisplayed()
            .tapBackButton()
        
        loginPage.checkPageOpened()
        
        loginPage.tapBackButton()
    }
}
