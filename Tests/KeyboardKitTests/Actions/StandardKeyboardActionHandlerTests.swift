//
//  StandardKeyboardActionHandlerTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2019-05-06.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Mockery
import KeyboardKit
import UIKit

class StandardKeyboardActionHandlerTests: QuickSpec {
    
    override func spec() {
        
        var handler: StandardKeyboardActionHandlerTestClass!
        var recorder: MockKeyboardActionHandler!
        var inputViewController: MockInputViewController!
        
        beforeEach {
            recorder = MockKeyboardActionHandler()
            inputViewController = MockInputViewController()
            handler = StandardKeyboardActionHandlerTestClass(
                recorder: recorder,
                inputViewController: inputViewController)
        }
        
        
        // MARK: - Actions
        
        describe("long press action") {
            
            func action(for action: KeyboardAction) -> Any? {
                return handler.longPressAction(for: action, view: UIView())
            }
            
            it("is by default the tap action") {
                expect(action(for: .dismissKeyboard)).toNot(beNil())
                expect(action(for: .backspace)).toNot(beNil())
                expect(action(for: .switchKeyboard)).to(beNil())
            }
        }
        
        describe("repeat action") {
            
            func action(for action: KeyboardAction) -> Any? {
                return handler.repeatAction(for: action, view: UIView())
            }
            
            it("is only applied to backspace") {
                expect(action(for: .dismissKeyboard)).to(beNil())
                expect(action(for: .backspace)).toNot(beNil())
                expect(action(for: .switchKeyboard)).to(beNil())
            }
        }
        
        describe("tap action") {
            
            func action(for action: KeyboardAction) -> Any? {
                return handler.tapAction(for: action, view: UIView())
            }
            
            it("is not nil for action types with standard action") {
                expect(action(for: .dismissKeyboard)).toNot(beNil())
                expect(action(for: .backspace)).toNot(beNil())
                expect(action(for: .switchKeyboard)).to(beNil())
            }
        }
        
        
        // MARK: - Action Handling
        
        describe("handling gesture on action") {
            
            it("TODO") {}
        }
        
        
        // MARK: - Haptic Feedback
        
        describe("giving haptic feedback") {
            
            it("can't be properyly tested") {
                handler.triggerHapticFeedback(for: .longPress, on: .dismissKeyboard)
                handler.triggerHapticFeedback(for: .repeatPress, on: .backspace)
                handler.triggerHapticFeedback(for: .tap, on: .dismissKeyboard)
                // TODO Test this
            }
        }
        
        
        // MARK: - Audio Feedback
        
        describe("giving haptic feedback for long press") {
            
            it("can't be properyly tested") {
                handler.triggerAudioFeedback(for: .dismissKeyboard)
                handler.triggerAudioFeedback(for: .backspace)
                handler.triggerAudioFeedback(for: .dismissKeyboard)
                // TODO Test this
            }
        }
    }
}


private class StandardKeyboardActionHandlerTestClass: StandardKeyboardActionHandler {
    
    public init(
        recorder: MockKeyboardActionHandler,
        inputViewController: UIInputViewController) {
        self.recorder = recorder
        super.init(inputViewController: inputViewController)
    }
    
    let recorder: MockKeyboardActionHandler
    
    override func triggerHapticFeedback(for gesture: KeyboardGesture, on action: KeyboardAction) {
        switch gesture {
        case .tap: recorder.giveHapticFeedbackForTap(on: action)
        case .longPress: recorder.giveHapticFeedbackForLongPress(on: action)
        case .repeatPress: recorder.giveHapticFeedbackForRepeat(on: action)
        }
    }
}
