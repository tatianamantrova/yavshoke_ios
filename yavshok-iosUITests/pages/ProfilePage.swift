//
//  ProfilePage.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import Foundation
import XCTest

final class ProfilePage {
    
    // MARK: - properties
    
    private let app: XCUIApplication
    
    private var profileImage: XCUIElement { app.images["profileImage"].firstMatch }
    
    private var userNameLabel: XCUIElement { app.staticTexts["userName"].firstMatch }
    private var ageLabel: XCUIElement { app.staticTexts["ageLabel"].firstMatch }
    
    private var logoutButton: XCUIElement { app.buttons["logoutButton"].firstMatch }
    private var editProfileButton: XCUIElement { app.buttons["editProfileButton"].firstMatch }
    
    // MARK: - initialization
    
    init(app: XCUIApplication) { self.app = app }
    
    // MARK: - functions
    
    @discardableResult
    func checkPageOpened() -> Self {
        checkExistence(profileImage)
        
        return self
    }
    
    @discardableResult
    func checkUserNameLabelIsDisplayed() -> Self {
        checkExistence(userNameLabel)
        
        return self
    }
    
    @discardableResult
    func checkAgeLabelIsDisplayed() -> Self {
        checkExistence(ageLabel)
        
        return self
    }
    
    @discardableResult
    func checkLogoutButtonIsDisplayed() -> Self {
        checkExistence(logoutButton)
        
        return self
    }
    
    @discardableResult
    func checkEditProfileButtonIsDisplayed() -> Self {
        checkExistence(editProfileButton)
        
        return self
    }
    
    @discardableResult
    func tapLogoutButton() -> Self {
        logoutButton.tap()
        
        return self
    }
    
    @discardableResult
    func tapEditProfileButton() -> Self {
        editProfileButton.tap()
        
        return self
    }
    
    @discardableResult
    func checkProfileImageIsDisplayed() -> Self {
        checkExistence(profileImage)
        
        return self
    }
    
    @discardableResult
    func checkUserName(_ name: String) -> Self {
        checkLabel(for: userNameLabel, with: name)
        
        return self
    }
}
