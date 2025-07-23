//
//  MainPage.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import Foundation
import XCTest

final class MainPage {
    
    // MARK: - properties
    
    private let app: XCUIApplication
    
    private var titleLabel: XCUIElement { app.staticTexts["mainTitle"].firstMatch }
    
    private var successLabel: XCUIElement { app.staticTexts["successText"].firstMatch }
    private var failureLabel: XCUIElement { app.staticTexts["failureText"].firstMatch }
    
    private var emailField: XCUIElement { app.textFields["emailInput"].firstMatch }
    
    private var checkButton: XCUIElement { app.buttons["checkButton"].firstMatch }
    private var loginButton: XCUIElement { app.buttons["navigationButton"].firstMatch }
    
    private var confetti: XCUIElement { app.otherElements["confetti"].firstMatch }
    
    private var successCat: XCUIElement { app.images["successCat"].firstMatch }
    
    // MARK: - initialization
    
    init(app: XCUIApplication) { self.app = app }
    
    // MARK: - functions
    
    @discardableResult
    func checkPageOpened() -> Self {
        checkExistence(titleLabel)
        
        return self
    }
    
    @discardableResult
    func checkEmailFieldIsDisplayed() -> Self {
        checkExistence(emailField)
        
        return self
    }
    
    @discardableResult
    func checkLoginButtonIsDisplayed() -> Self {
        checkExistence(loginButton)
        
        return self
    }
    
    @discardableResult
    func checkCheckButtonIsDisplayed() -> Self {
        checkExistence(checkButton)
        
        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        loginButton.tap()
        
        return self
    }
    
    @discardableResult
    func tapCheckButton() -> Self {
        checkButton.tap()
        
        return self
    }
    
    @discardableResult
    func typeEmail(_ email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        
        return self
    }
    
    @discardableResult
    func checkTypedEmail(_ email: String) -> Self {
        checkEditTextValue(for: emailField, with: email)
        
        return self
    }
    
    @discardableResult
    func checkSuccessLabelIsDisplayed() -> Self {
        checkExistence(successLabel)
        
        return self
    }
    
    @discardableResult
    func checkFailureLabelIsDisplayed() -> Self {
        checkExistence(failureLabel)
        
        return self
    }
    
    @discardableResult
    func checkConfettiIsDisplayed() -> Self {
        checkExistence(confetti)
        
        return self
    }
    
    @discardableResult
    func checkSuccessCatIsDisplayed() -> Self {
        checkExistence(successCat)
        
        return self
    }
}
