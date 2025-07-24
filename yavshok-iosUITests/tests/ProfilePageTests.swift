//
//  ProfilePageTests.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import XCTest

final class ProfilePageTests: XCTestCase {
    
    // MARK: - private prorerties
    
    private let app = XCUIApplication()
    
    private lazy var loginPage = LoginPage(app: app)
    private lazy var mainPage = MainPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
    private lazy var editProfilePage = EditProfilePage(app: app)
    
    override func setUp() {
        super.setUp()
        
        app.launch()
        
        mainPage
            .checkPageOpened()
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        
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
    }
    
    // MARK: - tests
    
    @MainActor
    func testShowAllViewsOnProfilePage(){
        profilePage
            .checkProfileImageIsDisplayed()
            .checkUserNameLabelIsDisplayed()
            .checkAgeLabelIsDisplayed()
            .checkEditProfileButtonIsDisplayed()
            .checkLogoutButtonIsDisplayed()
            .tapLogoutButton()
    }
    
    @MainActor
    func testNavigateFromProfilePageToMainPage() throws {
        profilePage
            .checkPageOpened()
            .checkLogoutButtonIsDisplayed()
            .tapLogoutButton()
        
        mainPage
            .checkPageOpened()
    }
    
    @MainActor
    func testNavigateFromProfilePageToEditPage() throws {
        profilePage
            .checkPageOpened()
            .checkEditProfileButtonIsDisplayed()
            .tapEditProfileButton()
        
        editProfilePage
            .checkPageOpened()
            .tapCancelButton()
        
        profilePage.tapLogoutButton()
    }
}
