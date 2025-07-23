//
//  EditProfilePage.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 22.07.2025.
//

import Foundation
import XCTest

final class EditProfilePage {
    
    // MARK: - properties
    
    private let app: XCUIApplication
    
    private var titleLabel: XCUIElement { app.staticTexts["titleEditProfile"].firstMatch }
    
    private var nameField: XCUIElement { app.textFields["nameField"].firstMatch }
    
    private var saveButton: XCUIElement { app.buttons["saveButton"].firstMatch }
    private var cancelButton: XCUIElement { app.buttons["cancelButton"].firstMatch }
    
    // MARK: - initialization
    
    init(app: XCUIApplication) { self.app = app }
    
    // MARK: - functions
    
    @discardableResult
    func checkPageOpened() -> Self {
        checkExistence(titleLabel)
        
        return self
    }
    
    @discardableResult
    func checkNameFieldIsDisplayed() -> Self {
        checkExistence(nameField)
        
        return self
    }
    
    @discardableResult
    func checkSaveButtonIsDisplayed() -> Self {
        checkExistence(saveButton)
        
        return self
    }
    
    @discardableResult
    func checkCancelButtonIsDisplayed() -> Self {
        checkExistence(cancelButton)
        
        return self
    }
    
    @discardableResult
    func tapSaveButton() -> Self {
        saveButton.tap()
        
        return self
    }
    
    @discardableResult
    func tapCancelButton() -> Self {
        cancelButton.tap()
        
        return self
    }
    
    @discardableResult
    func typeName(_ name: String) -> Self {
        nameField.tap()
        nameField.doubleTap()
        nameField.typeText(name)
        
        return self
    }
    
    @discardableResult
    func checkTypedName(_ name: String) -> Self {
        checkEditTextValue(for: nameField, with: name)
        
        return self
    }
}
