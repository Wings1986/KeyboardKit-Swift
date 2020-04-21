//
//  ImageKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-10-15.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import KeyboardKit

/**

 This demo keyboard has 24 buttons per page, which fits this
 demo app's two different grid sizes for portrait/landscape.
 It features one page of real emoji characters and four with
 image buttons, which are handled by the demo action handler.

 If you make any changes to this keyboard (which you should,
 play with it) the keyboard may get an uneven set of buttons,
 which the grid engine handles by adding empty dummy buttons
 at the very end.

 */
struct ImageKeyboard: DemoKeyboard {
    init(in viewController: KeyboardViewController) {
        bottomActions = EmojiKeyboard.bottomActions(
            leftmost: EmojiKeyboard.switchAction,
            for: viewController)
    }

    let actions: [KeyboardAction] = [
        .image(description: "color", keyboardImageName: "color", imageName: "color"),
        .image(description: "download", keyboardImageName: "download", imageName: "download"),
        .image(description: "edit", keyboardImageName: "edit", imageName: "edit"),
        .image(description: "cancel", keyboardImageName: "cancel", imageName: "cancel"),
        .image(description: "bubble", keyboardImageName: "bubble", imageName: "bubble"),
        .image(description: "box", keyboardImageName: "box", imageName: "box"),

        .image(description: "favorite", keyboardImageName: "favorite", imageName: "favorite"),
        .image(description: "globe", keyboardImageName: "globe", imageName: "globe"),
        .image(description: "help", keyboardImageName: "help", imageName: "help"),
        .image(description: "idea", keyboardImageName: "idea", imageName: "idea"),
    ]

    let actionsCat1: [KeyboardAction] = [
        .image(description: "aunt_1", keyboardImageName: "aunt_1_small", imageName: "aunt_1"),
        .image(description: "aunt_2", keyboardImageName: "aunt_2_small", imageName: "aunt_2"),
        .image(description: "aunt_3", keyboardImageName: "aunt_3_small", imageName: "aunt_3"),
        .image(description: "aunt_4", keyboardImageName: "aunt_4_small", imageName: "aunt_4"),
        .image(description: "aunt_5", keyboardImageName: "aunt_5_small", imageName: "aunt_5"),
        .image(description: "aunt_6", keyboardImageName: "aunt_6_small", imageName: "aunt_6"),
        .image(description: "aunt_7", keyboardImageName: "aunt_7_small", imageName: "aunt_7"),
        .image(description: "aunt_8", keyboardImageName: "aunt_8_small", imageName: "aunt_8"),
        .image(description: "aunt_9", keyboardImageName: "aunt_9_small", imageName: "aunt_9"),
        .image(description: "aunt_10", keyboardImageName: "aunt_10_small", imageName: "aunt_10"),
        .image(description: "aunt_11", keyboardImageName: "aunt_11_small", imageName: "aunt_11"),
        .image(description: "aunt_12", keyboardImageName: "aunt_12_small", imageName: "aunt_12"),
        .image(description: "aunt_13", keyboardImageName: "aunt_13_small", imageName: "aunt_13"),
        .image(description: "aunt_14", keyboardImageName: "aunt_14_small", imageName: "aunt_14"),
        .image(description: "aunt_15", keyboardImageName: "aunt_15_small", imageName: "aunt_15"),
        .image(description: "aunt_16", keyboardImageName: "aunt_16_small", imageName: "aunt_16"),
        .image(description: "aunt_17", keyboardImageName: "aunt_17_small", imageName: "aunt_17"),
        .image(description: "aunt_18", keyboardImageName: "aunt_18_small", imageName: "aunt_18"),
        .image(description: "aunt_19", keyboardImageName: "aunt_19_small", imageName: "aunt_19"),
        .image(description: "aunt_20", keyboardImageName: "aunt_20_small", imageName: "aunt_20"),
        .image(description: "aunt_21", keyboardImageName: "aunt_21_small", imageName: "aunt_21"),
        .image(description: "aunt_22", keyboardImageName: "aunt_22_small", imageName: "aunt_22"),
        .image(description: "aunt_23", keyboardImageName: "aunt_23_small", imageName: "aunt_23"),
        .image(description: "aunt_24", keyboardImageName: "aunt_24_small", imageName: "aunt_24"),
        .image(description: "aunt_25", keyboardImageName: "aunt_25_small", imageName: "aunt_25"),
        .image(description: "aunt_26", keyboardImageName: "aunt_26_small", imageName: "aunt_26"),
        .image(description: "aunt_27", keyboardImageName: "aunt_27_small", imageName: "aunt_27"),
        .image(description: "aunt_28", keyboardImageName: "aunt_28_small", imageName: "aunt_28"),
        .image(description: "aunt_29", keyboardImageName: "aunt_29_small", imageName: "aunt_29"),
        .image(description: "aunt_30", keyboardImageName: "aunt_30_small", imageName: "aunt_30"),
        .image(description: "aunt_31", keyboardImageName: "aunt_31_small", imageName: "aunt_31"),
        .image(description: "aunt_32", keyboardImageName: "aunt_32_small", imageName: "aunt_32"),
        .image(description: "aunt_33", keyboardImageName: "aunt_33_small", imageName: "aunt_33"),
        .image(description: "aunt_34", keyboardImageName: "aunt_34_small", imageName: "aunt_34"),
        .image(description: "aunt_35", keyboardImageName: "aunt_35_small", imageName: "aunt_35"),
        .image(description: "aunt_36", keyboardImageName: "aunt_36_small", imageName: "aunt_36"),
        .image(description: "aunt_37", keyboardImageName: "aunt_37_small", imageName: "aunt_37"),
        .image(description: "aunt_38", keyboardImageName: "aunt_38_small", imageName: "aunt_38"),
        .image(description: "aunt_39", keyboardImageName: "aunt_39_small", imageName: "aunt_39"),
        .image(description: "aunt_40", keyboardImageName: "aunt_40_small", imageName: "aunt_40"),
        .image(description: "aunt_41", keyboardImageName: "aunt_41_small", imageName: "aunt_41"),
        .image(description: "aunt_42", keyboardImageName: "aunt_42_small", imageName: "aunt_42"),
        .image(description: "aunt_43", keyboardImageName: "aunt_43_small", imageName: "aunt_43"),
        .image(description: "aunt_44", keyboardImageName: "aunt_44_small", imageName: "aunt_44"),
        .image(description: "aunt_45", keyboardImageName: "aunt_45_small", imageName: "aunt_45"),
        .image(description: "aunt_46", keyboardImageName: "aunt_46_small", imageName: "aunt_46"),
        .image(description: "aunt_47", keyboardImageName: "aunt_47_small", imageName: "aunt_47"),
        .image(description: "aunt_48", keyboardImageName: "aunt_48_small", imageName: "aunt_48"),
        .image(description: "aunt_49", keyboardImageName: "aunt_49_small", imageName: "aunt_49"),
        .image(description: "aunt_50", keyboardImageName: "aunt_50_small", imageName: "aunt_50"),
        .image(description: "aunt_51", keyboardImageName: "aunt_51_small", imageName: "aunt_51"),
        .image(description: "aunt_52", keyboardImageName: "aunt_52_small", imageName: "aunt_52"),
    ]

    let actionsCat2: [KeyboardAction] = [
        .image(description: "act1", keyboardImageName: "act1_small", imageName: "act1"),
        .image(description: "act2", keyboardImageName: "act2_small", imageName: "act2"),
        .image(description: "act3", keyboardImageName: "act3_small", imageName: "act3"),
        .image(description: "act4", keyboardImageName: "act4_small", imageName: "act4"),
        .image(description: "act5", keyboardImageName: "act5_small", imageName: "act5"),
        .image(description: "act6", keyboardImageName: "act6_small", imageName: "act6"),
        .image(description: "act7", keyboardImageName: "act7_small", imageName: "act7"),
        .image(description: "act8", keyboardImageName: "act8_small", imageName: "act8"),
        .image(description: "act9", keyboardImageName: "act9_small", imageName: "act9"),
        .image(description: "act10", keyboardImageName: "act10_small", imageName: "act10"),
        .image(description: "act11", keyboardImageName: "act11_small", imageName: "act11"),
        .image(description: "act12", keyboardImageName: "act12_small", imageName: "act12"),
        .image(description: "act13", keyboardImageName: "act13_small", imageName: "act13"),
        .image(description: "act14", keyboardImageName: "act14_small", imageName: "act14"),
        .image(description: "act15", keyboardImageName: "act15_small", imageName: "act15"),
        .image(description: "act16", keyboardImageName: "act16_small", imageName: "act16"),
    ]

    let actionsCat3: [KeyboardAction] = [
        .image(description: "food_1", keyboardImageName: "food_1_small", imageName: "food_1"),
        .image(description: "food_2", keyboardImageName: "food_2_small", imageName: "food_2"),
        .image(description: "food_3", keyboardImageName: "food_3_small", imageName: "food_3"),
        .image(description: "food_4", keyboardImageName: "food_4_small", imageName: "food_4"),
        .image(description: "food_5", keyboardImageName: "food_5_small", imageName: "food_5"),
        .image(description: "food_6", keyboardImageName: "food_6_small", imageName: "food_6"),
        .image(description: "food_7", keyboardImageName: "food_7_small", imageName: "food_7"),
        .image(description: "food_8", keyboardImageName: "food_8_small", imageName: "food_8"),
        .image(description: "food_9", keyboardImageName: "food_9_small", imageName: "food_9"),
        .image(description: "food_10", keyboardImageName: "food_10_small", imageName: "food_10"),
        .image(description: "food_11", keyboardImageName: "food_11_small", imageName: "food_11"),
        .image(description: "food_12", keyboardImageName: "food_12_small", imageName: "food_12"),
        .image(description: "food_13", keyboardImageName: "food_13_small", imageName: "food_13"),
        .image(description: "food_14", keyboardImageName: "food_14_small", imageName: "food_14"),
        .image(description: "food_15", keyboardImageName: "food_15_small", imageName: "food_15"),
        .image(description: "food_16", keyboardImageName: "food_16_small", imageName: "food_16"),
        .image(description: "food_17", keyboardImageName: "food_17_small", imageName: "food_17"),
        .image(description: "food_18", keyboardImageName: "food_18_small", imageName: "food_18"),
        .image(description: "food_19", keyboardImageName: "food_19_small", imageName: "food_19"),
        .image(description: "food_20", keyboardImageName: "food_20_small", imageName: "food_20"),
        .image(description: "food_21", keyboardImageName: "food_21_small", imageName: "food_21"),
    ]

    let actionsCat4: [KeyboardAction] = [
        .image(description: "object_1", keyboardImageName: "object_1_small", imageName: "object_1"),
        .image(description: "object_2", keyboardImageName: "object_2_small", imageName: "object_2"),
        .image(description: "object_3", keyboardImageName: "object_3_small", imageName: "object_3"),
        .image(description: "object_4", keyboardImageName: "object_4_small", imageName: "object_4"),
        .image(description: "object_5", keyboardImageName: "object_5_small", imageName: "object_5"),
        .image(description: "object_6", keyboardImageName: "object_6_small", imageName: "object_6"),
        .image(description: "object_7", keyboardImageName: "object_7_small", imageName: "object_7"),
        .image(description: "object_8", keyboardImageName: "object_8_small", imageName: "object_8"),
        .image(description: "object_9", keyboardImageName: "object_9_small", imageName: "object_9"),
        .image(description: "object_10", keyboardImageName: "object_10_small", imageName: "object_10"),
        .image(description: "object_11", keyboardImageName: "object_11_small", imageName: "object_11"),
        .image(description: "object_12", keyboardImageName: "object_12_small", imageName: "object_12"),
        .image(description: "object_13", keyboardImageName: "object_13_small", imageName: "object_13"),
        .image(description: "object_14", keyboardImageName: "object_14_small", imageName: "object_14"),
        .image(description: "object_15", keyboardImageName: "object_15_small", imageName: "object_15"),
        .image(description: "object_16", keyboardImageName: "object_16_small", imageName: "object_16"),
        .image(description: "object_17", keyboardImageName: "object_17_small", imageName: "object_17"),
        .image(description: "object_18", keyboardImageName: "object_18_small", imageName: "object_18"),
        .image(description: "object_19", keyboardImageName: "object_19_small", imageName: "object_19"),
        .image(description: "object_20", keyboardImageName: "object_20_small", imageName: "object_20"),
        .image(description: "object_21", keyboardImageName: "object_21_small", imageName: "object_21"),
        .image(description: "object_22", keyboardImageName: "object_22_small", imageName: "object_22"),
    ]

    let actionsCat5: [KeyboardAction] = [
        .image(description: "travel_1", keyboardImageName: "travel_1_small", imageName: "travel_1"),
        .image(description: "travel_2", keyboardImageName: "travel_2_small", imageName: "travel_2"),
        .image(description: "travel_3", keyboardImageName: "travel_3_small", imageName: "travel_3"),
        .image(description: "travel_4", keyboardImageName: "travel_4_small", imageName: "travel_4"),
        .image(description: "travel_5", keyboardImageName: "travel_5_small", imageName: "travel_5"),
        .image(description: "travel_6", keyboardImageName: "travel_6_small", imageName: "travel_6"),
        .image(description: "travel_7", keyboardImageName: "travel_7_small", imageName: "travel_7"),
        .image(description: "travel_8", keyboardImageName: "travel_8_small", imageName: "travel_8"),
        .image(description: "travel_9", keyboardImageName: "travel_9_small", imageName: "travel_9"),
        .image(description: "travel_10", keyboardImageName: "travel_10_small", imageName: "travel_10"),
        .image(description: "travel_11", keyboardImageName: "travel_11_small", imageName: "travel_11"),
        .image(description: "travel_12", keyboardImageName: "travel_12_small", imageName: "travel_12"),
        .image(description: "travel_13", keyboardImageName: "travel_13_small", imageName: "travel_13"),
        .image(description: "travel_14", keyboardImageName: "travel_14_small", imageName: "travel_14"),
        .image(description: "travel_15", keyboardImageName: "travel_15_small", imageName: "travel_15"),
        .image(description: "travel_16", keyboardImageName: "travel_16_small", imageName: "travel_16"),
        .image(description: "travel_17", keyboardImageName: "travel_17_small", imageName: "travel_17"),
        .image(description: "travel_18", keyboardImageName: "travel_18_small", imageName: "travel_18"),
    ]

    func getHistoryImages(_ stringKeys: [String: String]) -> [KeyboardAction] {
        var actions = [KeyboardAction]()
        let array = Array(stringKeys.keys)
        let newArray = Array(array.sorted(by: before(value1:value2:)))

        var count = 0
        for key in newArray {
            let newKey = key.components(separatedBy: "_-_")
            actions.append(.image(description: "\(newKey[1])", keyboardImageName: "\(newKey[1])", imageName: "\(stringKeys[key] ?? "")"))
            
            count += 1
            
            if count == 40 {
                break;
            }
        }
        return actions
    }

    func before(value1: String, value2: String) -> Bool {
        // One string is alphabetically first.
        // ... True means value1 precedes value2.
        let newKey = value1.components(separatedBy: "_-_")
        let newKey2 = value2.components(separatedBy: "_-_")
        let val1Value = Int(newKey[0])
        let val2Value = Int(newKey2[0])
        return val1Value! > val2Value!;
    }

    let bottomActions: KeyboardActionRow
}

private extension EmojiKeyboard {
    static var switchAction: KeyboardAction {
        .switchToKeyboard(.cat1_key)
    }
}
