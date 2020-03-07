//
//  EmojiHistoryModel.swift
//  KeyboardKitDemoKeyboard
//
//  Created by apple on 3/7/20.
//

import Foundation
import UIKit
class EmojiHistoryModel {
    static let shared = EmojiHistoryModel()

    func updateHistory(key: String, mainImage: String) {
        // Access Shared Defaults Object
        let userDefaults = UserDefaults.standard

        // Read/Get Dictionary
        guard userDefaults.object(forKey: "history") != nil else {
            createHistory(key, image: mainImage)
            return
        }
        var strings: [String: String] = userDefaults.object(forKey: "history") as! [String: String]
        // Add Key-Value Pair to Dictionary
        let array = Array(strings.keys)
        for oldKey in array {
            if oldKey.contains(key) {
                strings.removeValue(forKey: oldKey)
            }
        }

        strings["\(getIncrementalHistoryID())_-_\(key)"] = mainImage
        // Write/Set Dictionary
        userDefaults.set(strings, forKey: "history")
    }

    func getHistory() -> [String: String] {
        let userDefaults = UserDefaults.standard

        // Read/Get Dictionary
        let strings: [String: String] = userDefaults.object(forKey: "history") as? [String: String] ?? [:]

        return strings
    }

    func createHistory(_ key: String, image: String) {
        // Access Shared Defaults Object
        let userDefaults = UserDefaults.standard
        // Create and Write Dictionary
        let dictionary = ["\(getIncrementalHistoryID())_-_\(key)": "\(image)"]
        userDefaults.set(dictionary, forKey: "history")
    }

    func getIncrementalHistoryID() -> Int {
        var incFormID = UserDefaults.standard.integer(forKey: "bookmarkID")
        incFormID = incFormID + 1
        UserDefaults.standard.set(incFormID, forKey: "bookmarkID")
        return incFormID
    }
}
