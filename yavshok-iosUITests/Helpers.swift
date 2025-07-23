//
//  Helpers.swift
//  yavshok-iosUITests
//
//  Created by Tatiana Mantrova on 23.07.2025.
//

import Foundation
import XCTest

enum Constants {
    
    static let timeOutWait: Double = 3
}

/// Проверка наличия элемента
/// - Parameter element: Проверяемый элемент
func checkExistence(_ element: XCUIElement) {
    XCTAssertEqual(
        element.waitForExistence(
            timeout: Constants.timeOutWait),
        true,
        "Element not found."
    )
}

/// Проверка введенного значения в поле ввода
/// - Parameters:
///   - element: Проверяемый элемент
///   - content: Проверяемое значение
func checkEditTextValue(for element: XCUIElement, with content: String) {
    XCTAssert(element.value.debugDescription.contains(content))
}

/// Проверка плэйсхолдера в элементе
/// - Parameters:
///   - element: Проверяемый элемент
///   - placeholder: Проверяемое значение
func checkEditTextPlaceholder(for element: XCUIElement, with placeholder: String) {
    XCTAssert(element.placeholderValue == placeholder)
}

/// Проверка значения в лейбле
/// - Parameters:
///   - element: Проверяемый элемент
///   - label: Проверяемое значение
func checkLabel(for element: XCUIElement, with label: String) {
    XCTAssert(element.label == label)
}
