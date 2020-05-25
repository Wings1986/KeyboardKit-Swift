//
//  DemoKeyboardActionHandler.swift
//  KeyboardKitExampleKeyboard
//
//  Created by Daniel Saidi on 2019-04-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import UIKit

import Firebase
/**

 This action handler inherits `StandardKeyboardActionHandler`
 and adds demo-specific functionality to it.

 */
class DemoKeyboardActionHandler: StandardKeyboardActionHandler {
    // MARK: - Initialization

    public init(inputViewController: UIInputViewController) {
        keyboardShiftState = .lowercased
        super.init(
            inputViewController: inputViewController,
            hapticConfiguration: .standard
        )
    }

    // MARK: - Properties

    private var keyboardShiftState: KeyboardShiftState

    private var demoViewController: KeyboardViewController? {
        inputViewController as? KeyboardViewController
    }

    // MARK: - Actions

    override func longPressAction(for action: KeyboardAction, view: UIView) -> GestureAction? {
        switch action {
        // case let .image(_, _, imageName): return { [weak self] in self?.saveImage(UIImage(named: imageName)!) }
        case .shift: return switchToCapsLockedKeyboard
        default: return super.longPressAction(for: action, view: view)
        }
    }

    override func tapAction(for action: KeyboardAction, view: UIView) -> GestureAction? {
        switch action {
        case .character: return handleCharacter(action, for: view)
        case let .image(_, keyImage, imageName):
            do {
            print("\(keyImage)")
                EmojiHistoryModel.shared.updateHistory(key: keyImage, mainImage: imageName)
            return {
                
                [weak self] in self?.copyImage(UIImage(named: imageName)!)
                
                /* iGold
                Analytics.logEvent(AnalyticsEventViewItem, parameters: [
                                    AnalyticsParameterItemID: "ios-keyboard",
                                    AnalyticsParameterItemName: "emoji",
                                    AnalyticsParameterContentType: imageName
                ])
                 */
                
            }
        }
        case .shift: return switchToUppercaseKeyboard
        case .shiftDown: return switchToLowercaseKeyboard
        case .space: return handleSpace(for: view)
        case let .switchToKeyboard(type): return { [weak self] in

//            self?.demoViewController?.tabButton?.buttonImageMain.image = self?.demoViewController?.tabButton?.currentAction!.buttonCatImages(for: (self?.demoViewController?.tabButton!.currentKeyboard)!)
            
            let demoButton: DemoButton = view as! DemoButton
            self?.demoViewController?.tabButton = demoButton

//            self?.demoViewController?.tabButton?.buttonImageMain.image = self?.demoViewController?.tabButton?.currentAction!.buttonSelectedCatImages(for: type)
            
//            self?.demoViewController?.tabButton?.buttonImageMain.image = self?.demoViewController?.tabButton?.currentAction!.buttonCatImages(for: type)

            self?.demoViewController?.keyboardCollection?.preRefresh()
//            let keyboard = ImageKeyboard(in: (self?.demoViewController)!)
       
            DemoButton.currentActiveButton = type

            if type != .history_key {
                self?.demoViewController?.keyboardType = type
            }
                    
                  
            if type == .history_key {
                
                self?.demoViewController?.setupKeyboard()
                
                DispatchQueue.main.async {
                    
                    let keyboard = ImageKeyboard(in: (self?.demoViewController)!)
                    let actionsNew = keyboard.getHistoryImages(EmojiHistoryModel.shared.getHistory())
                    self?.demoViewController?.keyboardCollection?.actions = actionsNew
                    self?.demoViewController?.keyboardCollection?.reloadSetup(actionsNew)
                    self?.demoViewController?.labelCategory?.text = "   HISTORY"
                    //DemoButton.currentActiveButton = .history_key
                    
                }
                
            }
            
    
            if type == .cat1_key {
                //self?.demoViewController?.keyboardType = .cat1_key
//                self?.demoViewController?.keyboardCollection?.actions = keyboard.actionsCat1
//                self?.demoViewController?.keyboardCollection?.reloadSetup(keyboard.actionsCat1)
                self?.demoViewController?.labelCategory?.text = "   EXPRESSIONS"
                //DemoButton.currentActiveButton = .cat1_key
            }
            if type == .cat2_key {
                //self?.demoViewController?.keyboardType = .cat2_key
//                self?.demoViewController?.keyboardCollection?.actions = keyboard.actionsCat2
//                self?.demoViewController?.keyboardCollection?.reloadSetup(keyboard.actionsCat2)
                self?.demoViewController?.labelCategory?.text = "   ACTIVITIES"
                //DemoButton.currentActiveButton = .cat2_key
            }
            if type == .cat3_key {
                //self?.demoViewController?.keyboardType = .cat3_key
//                self?.demoViewController?.keyboardCollection?.actions = keyboard.actionsCat3
//                self?.demoViewController?.keyboardCollection?.reloadSetup(keyboard.actionsCat3)
                self?.demoViewController?.labelCategory?.text = "   FOOD & DRINK"
                //DemoButton.currentActiveButton = .cat3_key
            }
            if type == .cat4_key {
                //self?.demoViewController?.keyboardType = .cat4_key
//                self?.demoViewController?.keyboardCollection?.actions = keyboard.actionsCat4
//                self?.demoViewController?.keyboardCollection?.reloadSetup(keyboard.actionsCat4)
                self?.demoViewController?.labelCategory?.text = "   OBJECTS & SYMBOLS"
                //DemoButton.currentActiveButton = .cat4_key
            }
            if type == .cat5_key {
                //self?.demoViewController?.keyboardType = .cat5_key
//                self?.demoViewController?.keyboardCollection?.actions = [.switchToKeyboard(.cat5_key)]
//                self?.demoViewController?.keyboardCollection?.reloadSetup([.switchToKeyboard(.cat5_key)])
                self?.demoViewController?.labelCategory?.text = "   TRAVEL & PLACES"
                //DemoButton.currentActiveButton = .cat5_key
            }

            self?.demoViewController?.keyboardCollection?.refresh()
        }
        default: return super.tapAction(for: action, view: view)
        }
    }

    // MARK: - Action Handling

    override func handle(_ gesture: KeyboardGesture, on action: KeyboardAction, view: UIView) {
        super.handle(gesture, on: action, view: view)
        demoViewController?.requestAutocompleteSuggestions()
    }
}

// MARK: - Image Functions

@objc extension DemoKeyboardActionHandler {
    func handleImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if error == nil { alert("Saved!") }
        else { alert("Failed!") }
    }
}

// MARK: - Actions

private extension DemoKeyboardActionHandler {
    func alert(_ message: String) {
        guard let input = inputViewController as? KeyboardViewController else { return }
        input.alerter.alert(message: message, in: input.view, withDuration: 4)
    }

    func copyImage(_ image: UIImage) {
        guard let input = inputViewController as? KeyboardViewController else { return }
        guard input.hasFullAccess else {
            //return alert("You must enable full access to copy images.")
            guard let input = inputViewController as? KeyboardViewController else { return }
            input.dialoger.addView(in: input.view)
            return
        }
        guard image.copyToPasteboard() else { return alert("The image could not be copied.") }
        alert("Copied. Now paste it!")
    }

    func handleCharacter(_ action: KeyboardAction, for view: UIView) -> GestureAction {
        let baseAction = super.tapAction(for: action, view: view)
        return { [weak self] in
            baseAction?()
            let isUppercased = self?.keyboardShiftState == .uppercased
            guard isUppercased else { return }
            self?.switchToAlphabeticKeyboard(.lowercased)
        }
    }

    func handleSpace(for view: UIView) -> GestureAction {
        let baseAction = super.tapAction(for: .space, view: view)
        return { [weak self] in
            baseAction?()
            let isNonAlpha = self?.demoViewController?.keyboardType != .alphabetic(uppercased: false)
            guard isNonAlpha else { return }
            self?.switchToAlphabeticKeyboard(.lowercased)
        }
    }

    func saveImage(_ image: UIImage) {
        guard let input = inputViewController as? KeyboardViewController else { return }
        guard input.hasFullAccess else { return alert("You must enable full access to save images to photos.") }
        let saveCompletion = #selector(handleImage(_:didFinishSavingWithError:contextInfo:))
        image.saveToPhotos(completionTarget: self, completionSelector: saveCompletion)
    }

    func switchToAlphabeticKeyboard(_ state: KeyboardShiftState) {
        keyboardShiftState = state
        demoViewController?.keyboardType = .alphabetic(uppercased: state.isUppercased)
    }

    func switchToCapsLockedKeyboard() {
        switchToAlphabeticKeyboard(.capsLocked)
    }

    func switchToLowercaseKeyboard() {
        switchToAlphabeticKeyboard(.lowercased)
    }

    func switchToUppercaseKeyboard() {
        switchToAlphabeticKeyboard(.uppercased)
    }
}
