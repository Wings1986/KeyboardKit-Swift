//
//  DemoKeyboard.swift
//  KeyboardKitExampleKeyboard
//
//  Created by Daniel Saidi on 2019-05-14.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import KeyboardKit

/**
 This protocol is used by the demo application keyboards and
 provides shared functionality.

 The demo keyboards are for demo purposes, so they lack some
 functionality, like adapting to other languages, device types etc.
 */
protocol DemoKeyboard {}

extension DemoKeyboard {
    static func bottomActions(leftmost: KeyboardAction, for vc: KeyboardViewController) -> KeyboardActionRow {
        let actions = [.switchKeyboard, imageAction(for: vc, catType: 0),imageAction(for: vc, catType: 1), imageAction(for: vc, catType: 2), imageAction(for: vc, catType: 3), imageAction(for: vc, catType: 4), imageAction(for: vc, catType: 5), .backspace]
        return  actions
    }
}

private extension DemoKeyboard {
    static func switchAction(for vc: KeyboardViewController) -> KeyboardAction {
        let needsSwitch = vc.needsInputModeSwitchKey
        return needsSwitch ? .switchKeyboard : .switchToKeyboard(.emojis)
    }

    static func imageAction(for vc: KeyboardViewController, catType: Int) -> KeyboardAction {
       
        
        if catType == 0 {
            return .switchToKeyboard(.history_key)
        }
        if catType == 1 {
            return .switchToKeyboard(.cat1_key)
        }
        if catType == 2 {
            return .switchToKeyboard(.cat2_key)
        }
        if catType == 3 {
            return .switchToKeyboard(.cat3_key)
        }
        if catType == 4 {
            return .switchToKeyboard(.cat4_key)
        }
        if catType == 5 {
            return .switchToKeyboard(.cat5_key)
        }
        return .switchToKeyboard(.images)
    }
}

private extension Collection where Element == KeyboardAction {
    var withoutImageActions: [KeyboardAction] {
        filter { $0 != .switchToKeyboard(.emojis) }
            .filter { $0 != .switchToKeyboard(.images) }
    }
}
