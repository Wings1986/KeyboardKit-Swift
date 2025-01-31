//
//  AlphabeticKeyboard.swift
//  KeyboardKitExampleKeyboard
//
//  Created by Daniel Saidi on 2019-05-13.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import KeyboardKit

/**
 This demo keyboard mimicks an English alphabetic keyboard.
 */
struct AlphabeticKeyboard: DemoKeyboard {
    
    init(uppercased: Bool, in viewController: KeyboardViewController) {
        DemoButton.keyboardTypeEnabled = .text
        viewController.view.backgroundColor = .clearTappable
        actions = AlphabeticKeyboard.actions(
            uppercased: uppercased,
            in: viewController)
    }

    var actions: KeyboardActionRows
}

private extension AlphabeticKeyboard {
    
    static func actions(
        uppercased: Bool,
        in viewController: KeyboardViewController) -> KeyboardActionRows {
        KeyboardActionRows
            .from(characters(uppercased: uppercased))
            .addingSideActions(uppercased: uppercased)
            .appending(bottomActions(leftmost: switchAction, for: viewController))
    }
    
    static func bottomActions(leftmost: KeyboardAction, for vc: KeyboardViewController) -> KeyboardActionRow {
        return [ switchAction, .switchKeyboard, .space, .switchToKeyboard(.cat1_key), .newLine ]
    }
    
    static let characters: [[String]] = [
        ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
        ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
        ["z", "x", "c", "v", "b", "n", "m"]
    ]
    
    static func characters(uppercased: Bool) -> [[String]] {
        uppercased ? characters.uppercased() : characters
    }
    
    static var switchAction: KeyboardAction {
        .switchToKeyboard(.numeric)
    }
}

private extension Sequence where Iterator.Element == KeyboardActionRow {
    
    func addingSideActions(uppercased: Bool) -> [Iterator.Element] {
        var result = map { $0 }
        result[1].insert(.command, at: 0)
        result[1].append(.none)
        result[1].append(.command)
        result[1].append(.none)

        result[2].insert(uppercased ? .shiftDown : .shift, at: 0)
        result[2].insert(.none, at: 1)
        result[2].append(.none)
        result[2].append(.backspace)
        return result
    }
}
