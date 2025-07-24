//
//  LoginPageTests.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import XCTest
import Fakery

final class LoginPageTests: XCTestCase {
    
    // MARK: - private prorerties
    
    private let app = XCUIApplication()
    private var faker = Faker()
    
    private lazy var loginPage = LoginPage(app: app)
    private lazy var mainPage = MainPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
    
    // MARK: - override functions
    
    override func setUp() {
        super.setUp()
        
        app.launch()
        
        mainPage
            .checkPageOpened()
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
    }
    
    // MARK: - tests
    
    @MainActor
    func testShowErrorOnLoginPage() throws {
        let testCases: [(email: String, password: String, description: String)] = [
            ("test@", faker.internet.password(minimumLength: 6, maximumLength: 20), "Ввод почты без домена"),
            (faker.internet.email(), faker.internet.password(minimumLength: 1, maximumLength: 4), "Ввод почты с паролем меньше 5 символов")
        ]
        
        for (email, password, description) in testCases {
            XCTContext.runActivity(named: "Тестовый сценарий: \(description)") { _ in
                loginPage
                    .checkPageOpened()
                    .checkEmailFieldIsDisplayed()
                    .checkPasswordFieldIsDisplayed()
                    .typeEmail(email)
                    .typePassword(password)
                    .tapLoginButton()
                    .checkErrorLabelIsDisplayed()
                
                loginPage.tapBackButton()
                mainPage.tapLoginButton()
            }
        }
        
        loginPage.tapBackButton()
    }
    
    @MainActor
    func testShowPlaceholdersOnMainPage() throws {
        loginPage
            .checkPageOpened()
            .checkEmailFieldIsDisplayed()
            .checkEmailPlaceholderIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .checkPasswordPlaceholderIsDisplayed()
            .tapBackButton()
    }
    
    @MainActor
    func testNavigateFromLoginPageToMainPage() throws {
        loginPage
            .checkPageOpened()
            .checkBackButtonIsDisplayed()
            .tapBackButton()
        
        mainPage.checkPageOpened()
    }
    
    @MainActor
    func testNavigateFromLoginPageToRegisterPage() throws {
        loginPage
            .checkPageOpened()
            .checkRegisterButtonIsDisplayed()
            .tapRegisterButton()
        
        registerPage
            .checkPageOpened()
            .tapBackButton()
        
        loginPage.tapBackButton()
    }
    
    @MainActor
    func testNavigateFromLoginPageToProfilePage() throws {
        loginPage
            .checkPageOpened()
            .checkEmailFieldIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .typeEmail("testuser@domain.com")
            .typePassword("123456")
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        
        profilePage
            .checkPageOpened()
            .tapLogoutButton()
    }
}
