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
        
        loginPage
            .checkPageOpened()
            .checkRegisterButtonIsDisplayed()
            .tapRegisterButton()
        
        registerPage.checkPageOpened()
    }
    
    // MARK: - tests
    
    @MainActor
    func testSuccessRegisterUser() throws {
        let email = faker.internet.email()
        let password = faker.internet.password(minimumLength: 6, maximumLength: 20)
        let age = faker.number.randomInt(min: 0, max: 99)
        
        registerPage
            .checkEmailFieldIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .checkAgeFieldIsDisplayed()
            .typeEmail(email)
            .typePassword(password)
            .typeAge(age)
            .tapRegisterButton()
        
        profilePage
            .checkPageOpened()
            .tapLogoutButton()
    }
    
    @MainActor
    func testCheckStatusYoungCat() throws {
        let testCases: [(email: String, password: String, age: Int, description: String)] = [
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 0, "Ты молоденькиий котик - Нижнее граничное значение 1"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 1, "Ты молоденькиий котик - Нижнее граничное значение 2"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 20, "Ты молоденькиий котик - Верхнее граничное значение 1"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 21, "Ты молоденькиий котик - Верхнее граничное значение 2")
        ]
        
        checkStatus(
            testCases: testCases,
            statusText: "Ты молоденькиий котик"
        )
    }
    
    @MainActor
    func testCheckStatusAdultCat() throws {
        let testCases: [(email: String, password: String, age: Int, description: String)] = [
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 22, "Ты взрослый котик - Нижнее граничное значение 1"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 23, "Ты взрослый котик - Нижнее граничное значение 2"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 67, "Ты взрослый котик - Верхнее граничное значение 1"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 68, "Ты взрослый котик - Верхнее граничное значение 2")
        ]
        
        checkStatus(
            testCases: testCases,
            statusText: "Ты взрослый котик"
        )
    }
    
    @MainActor
    func testCheckStatusOldCat() throws {
        let testCases: [(email: String, password: String, age: Int, description: String)] = [
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 69, "Ты старый котик - Нижнее граничное значение 1"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 70, "Ты старый котик - Нижнее граничное значение 2"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 98, "Ты старый котик - Верхнее граничное значение 1"),
            (faker.internet.email(), faker.internet.password(minimumLength: 6, maximumLength: 20), 99, "Ты старый котик - Верхнее граничное значение 2")
        ]
        
        checkStatus(
            testCases: testCases,
            statusText: "Ты старый котик"
        )
    }
    
    @MainActor
    func testShowPlaceholdersOnRegisterPage() throws {
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
    
    // MARK: - private functions
    
    private func checkStatus(
        testCases: [(String, String, Int, String)],
        statusText: String
    ) {
        
        for (email, password, age, description) in testCases {
            XCTContext.runActivity(named: "Тестовый сценарий: \(description)") { _ in
                registerPage
                    .checkEmailFieldIsDisplayed()
                    .checkPasswordFieldIsDisplayed()
                    .checkAgeFieldIsDisplayed()
                    .typeEmail(email)
                    .typePassword(password)
                    .typeAge(age)
                    .tapRegisterButton()
                
                profilePage
                    .checkPageOpened()
                    .checkAgeLabelIsDisplayed()
                    .checkEqualUserStatus(with: statusText)
                    .checkLogoutButtonIsDisplayed()
                    .tapLogoutButton()
                
                app.terminate()
                setUp()
            }
        }
    }
}
