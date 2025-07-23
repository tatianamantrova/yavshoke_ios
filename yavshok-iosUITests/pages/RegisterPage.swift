//
//  RegisterPage.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import XCTest

final class RegisterPage {
    
    // MARK: - properties
    
    private let app: XCUIApplication
    
    private var titleLabel: XCUIElement { app.staticTexts["registerTitle"].firstMatch }
    private var errorLabel: XCUIElement { app.staticTexts["validationError"].firstMatch }
    
    private var emailField: XCUIElement { app.textFields["emailField"].firstMatch }
    private var passwordField: XCUIElement { app.secureTextFields["passwordField"].firstMatch }
    private var ageField: XCUIElement { app.textFields["ageField"].firstMatch }
    
    private var registerButton: XCUIElement { app.buttons["registerButton"].firstMatch }
    private var backButton: XCUIElement { app.buttons["backButton"].firstMatch }
    
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
    func checkPasswordFieldIsDisplayed() -> Self {
        checkExistence(passwordField)
        
        return self
    }
    
    @discardableResult
    func checkAgeFieldIsDisplayed() -> Self {
        checkExistence(passwordField)
        
        return self
    }
    
    @discardableResult
    func checkBackButtonIsDisplayed() -> Self {
        checkExistence(backButton)
        
        return self
    }
    
    @discardableResult
    func checkRegistrationButtonIsDisplayed() -> Self {
        checkExistence(registerButton)
        
        return self
    }
    
    @discardableResult
    func tapBackButton() -> Self {
        backButton.tap()
        
        return self
    }
    
    @discardableResult
    func tapRegisterButton() -> Self {
        registerButton.tap()
        
        return self
    }
    
    @discardableResult
    func typeEmail(_ email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        
        return self
    }
    
    @discardableResult
    func typePassword(_ password: String) -> Self {
        passwordField.tap()
        passwordField.typeText(password)
        
        return self
    }
    
    @discardableResult
    func typeAge(_ age: Int) -> Self {
        ageField.tap()
        ageField.typeText(String(age))
        
        return self
    }
    
    @discardableResult
    func checkErrorLabelIsDisplayed() -> Self {
        checkExistence(errorLabel)
        
        return self
    }
    
    @discardableResult
    func checkEmailPlaceholderIsDisplayed() -> Self {
        checkEditTextPlaceholder(for: emailField, with: "Введите email")
        
        return self
    }
    
    @discardableResult
    func checkPasswordPlaceholderIsDisplayed() -> Self {
        checkEditTextPlaceholder(for: passwordField, with: "Пароль")
        
        return self
    }
    
    @discardableResult
    func checkAgePlaceholderIsDisplayed() -> Self {
        checkEditTextPlaceholder(for: ageField, with: "Возраст")
        
        return self
    }
}
