//
//  EditProfilePageTests.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import Foundation
import XCTest
import Fakery

final class EditProfilePageTests: XCTestCase {
    
    // MARK: - private prorerties
    
    private let app = XCUIApplication()
    private var faker = Faker()
    
    private lazy var loginPage = LoginPage(app: app)
    private lazy var mainPage = MainPage(app: app)
    private lazy var profilePage = ProfilePage(app: app)
    private lazy var editProfilePage = EditProfilePage(app: app)
    
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
            .checkEmailFieldIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .typeEmail("testuser@domain.com")
            .typePassword("123456")
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        
        profilePage
            .checkPageOpened()
            .tapEditProfileButton()
        
        editProfilePage.checkPageOpened()
    }
    
    override func tearDown() {
        super.tearDown()
        
        profilePage.tapLogoutButton()
    }
    
    // MARK: - tests
    
    @MainActor
    func testShowAllViewsOnProfilePage(){
        editProfilePage
            .checkNameFieldIsDisplayed()
            .checkSaveButtonIsDisplayed()
            .checkCancelButtonIsDisplayed()
            .tapCancelButton()
    }
    
    @MainActor
    func testNavigateFromEditProfilePageToProfilePage() throws {
        editProfilePage
            .checkCancelButtonIsDisplayed()
            .tapCancelButton()
        
        profilePage.checkPageOpened()
    }
    
    @MainActor
    func testChangeNameOnProfilePage() throws {
        let name = faker.name.firstName()
        
        editProfilePage
            .typeName(name)
            .checkTypedName(name)
            .tapSaveButton()
        
        profilePage
            .checkPageOpened()
            .checkUserName(name)
    }
}
