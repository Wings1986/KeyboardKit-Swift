//
//  DemoButton.swift
//  KeyboardKitExampleKeyboard
//
//  Created by Daniel Saidi on 2019-04-30.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*

 This demo-specific button view represents a keyboard button
 like the one used in the iOS system keyboard. The file also
 contains a set of extensions for `KeyboardAction` that only
 applies to this button type.

 */

import KeyboardKit
import UIKit

class DemoButton: KeyboardButtonView {
    
    enum KeyboardTypeEnabled {
        case emoji
        case text
    }
    
    static var keyboardTypeEnabled: KeyboardTypeEnabled = .emoji
    
    public func setup(with action: KeyboardAction, in viewController: KeyboardInputViewController, distribution: UIStackView.Distribution = .fillEqually) {
        super.setup(with: action, in: viewController)
        backgroundColor = .clearTappable
        //

        DispatchQueue.main.async {
            self.buttonImageMain?.image = action.buttonImage
            self.buttonImageMain.contentMode = .scaleAspectFit
            
        }

        switch action {
        case let .switchToKeyboard(type):
            
            if type == .history_key || type == .cat2_key || type == .cat3_key || type == .cat4_key || type == .cat5_key {
                
                DispatchQueue.main.async {
                    self.currentKeyboard = type
                    self.buttonImageMain?.image = action.buttonCatImages(for: type)
                    
                    self.buttonImageMain.contentMode = .center
                }
            }
            else if type == .cat1_key
            {
                DispatchQueue.main.async {
                    self.currentKeyboard = type
                    self.buttonImageMain?.image = action.buttonCatImages(for: type)
//                    self.buttonImageMain?.image = action.buttonSelectedCatImages(for: type)
                    self.buttonImageMain.contentMode = .center
                    let demo = viewController as? KeyboardViewController
                    demo?.tabButton = self
                    
                }
            }
        case .backspace:
            DispatchQueue.main.async {
                self.buttonImageMain?.image = action.buttonImage
                self.buttonImageMain.contentMode = .center
            }
            break

        default: print("")
        }
        textLabel?.font = action.buttonFont
        textLabel?.text = action.buttonText
        textLabel?.textColor = action.tintColor(in: viewController)
        buttonView?.tintColor = action.tintColor(in: viewController)
        buttonView?.backgroundColor = viewController.view.tintColor
        
        width = action.buttonWidth(for: distribution)
        applyShadow(.standardButtonShadow)
        currentAction = action
        currentCatButton = self
        
        switch DemoButton.keyboardTypeEnabled {
        case .emoji: buttonView?.backgroundColor = .clear
        case .text: buttonView?.backgroundColor = .white
        }
    
    }

    var currentAction: KeyboardAction?
    var currentKeyboard: KeyboardType?
    var currentCatButton: DemoButton?
    @IBOutlet var buttonImageMain: UIImageView!
    @IBOutlet var buttonView: UIView? {
        didSet { buttonView?.layer.cornerRadius = 7 }
    }

    @IBOutlet var textLabel: UILabel?
//    {
//        didSet { textLabel?.text = "" }
//    }
}

// MARK: - Private button-specific KeyboardAction Extensions

extension KeyboardAction {
    func buttonColor(for viewController: KeyboardInputViewController) -> UIColor {
        let dark = useDarkAppearance(in: viewController)
        let asset = useDarkButton
            ? (dark ? Asset.Colors.darkSystemButton : Asset.Colors.lightSystemButton)
            : (dark ? Asset.Colors.darkButton : Asset.Colors.lightButton)
        return asset.color
    }

    var buttonFont: UIFont {
        return .preferredFont(forTextStyle: buttonFontStyle)
    }

    var buttonFontStyle: UIFont.TextStyle {
        switch self {
        case .character: return .title2
        case .switchToKeyboard(.emojis): return .title1
        default: return .body
        }
    }

    var buttonImage: UIImage? {
        switch self {
        case .image(_, let imageName, _): return UIImage(named: imageName)
        case .backspace: return Asset.Images.Buttons.backspace.image
        case .switchKeyboard: return Asset.Images.Buttons.switchKeyboard.image
        default: return nil
        }
    }

    var buttonText: String? {
        switch self {
        //case .backspace: return "⌫"
        case let .character(text): return text
        case .newLine: return "return"
        case .shift, .shiftDown: return "⇧"
        case .space: return "space"
        case let .switchToKeyboard(type): return buttonText(for: type)
        default: return nil
        }
    }

    func buttonText(for keyboardType: KeyboardType) -> String {
        switch keyboardType {
        case .alphabetic: return "ABC"
        case .emojis: return "🙂"
        case .images: return "🖼️"
        case .numeric: return "123"
        case .symbolic: return "#+="
        default: return ""
        }
    }

    var buttonMainImage: UIImage? {
        switch self {
        case let .switchToKeyboard(type): return buttonCatImages(for: type)
        default: return nil
        }
    }

    func buttonCatImages(for keyboardType: KeyboardType) -> UIImage? {
        switch keyboardType {
        case .history_key: return UIImage(named: "history_key")
        case .cat1_key: return UIImage(named: "cat1_key")
        case .cat2_key: return UIImage(named: "cat2_key")
        case .cat3_key: return UIImage(named: "cat3_key")
        case .cat4_key: return UIImage(named: "cat4_key")
        case .cat5_key: return UIImage(named: "cat5_key")
            
        default: return UIImage(named: "cat5_key")
        }
    }
    
    func buttonSelectedCatImages(for keyboardType: KeyboardType) -> UIImage? {
        switch keyboardType {
        case .history_key: return UIImage(named: "history_key_sel")
        case .cat1_key: return UIImage(named: "cat1_key_sel")
        case .cat2_key: return UIImage(named: "cat2_key_sel")
        case .cat3_key: return UIImage(named: "cat3_key_sel")
        case .cat4_key: return UIImage(named: "cat4_key_sel")
        case .cat5_key: return UIImage(named: "cat5_key_sel")

        default: return UIImage(named: "cat1_key_sel")
        }
    }

    

    var buttonWidth: CGFloat {
        switch self {
        case .none: return 10
        case .shift, .shiftDown: return 40
        case .space: return 100
        case .newLine: return 80
        default: return 35
        }
    }

    func buttonWidth(for distribution: UIStackView.Distribution) -> CGFloat {
        let adjust = distribution == .fillProportionally
        return adjust ? buttonWidth * 100 : buttonWidth
    }

    func tintColor(in viewController: KeyboardInputViewController) -> UIColor {
        let dark = useDarkAppearance(in: viewController)
        let asset = useDarkButton
            ? (dark ? Asset.Colors.darkSystemButtonText : Asset.Colors.lightSystemButtonText)
            : (dark ? Asset.Colors.darkButtonText : Asset.Colors.lightButtonText)
        return asset.color
    }

    func useDarkAppearance(in viewController: KeyboardInputViewController) -> Bool {
        let appearance = viewController.textDocumentProxy.keyboardAppearance ?? .default
        return appearance == .dark
    }

    var useDarkButton: Bool {
        switch self {
        case .character, .image, .shiftDown, .space: return false
        default: return true
        }
    }
}
