//
//  KeyboardViewController.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2018-03-04.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import KeyboardKit

import Firebase

/**
 This demo app handles system actions as normal (e.g. change
 keyboard, space, new line etc.), injects strings and emojis
 into the text proxy and handles the rightmost images in the
 emoji keyboard by copying them to the pasteboard on tap and
 saving them to the user's photo album on long press.
 
 IMPORTANT: To use this demo keyboard, you have to enable it
 in system settings ("Settings/General/Keyboards") then give
 it full access (this requires enabling `RequestsOpenAccess`
 in `Info.plist`) if you want to use image buttons. You must
 also add a `NSPhotoLibraryAddUsageDescription` to your host
 app's `Info.plist` if you want to be able to save images to
 the photo album. This is already taken care of in this demo
 app, so you can just copy the setup into your own app.
 
 The keyboard is setup in `viewDidAppear(...)` since this is
 when `needsInputModeSwitchKey` first gets the correct value.
 Before this point, the value is `true` even if it should be
 `false`. If you find a way to solve this bug, you can setup
 the keyboard earlier.
 
 The autocomplete parts of this class is the first iteration
 of autocomplete support in KeyboardKit. The intention is to
 move these parts to `KeyboardInputViewController` and a new
 api for working with autocomplete.
 
 **IMPORTANT** `textWillChange` and `textDidChange` does not
 trigger when a user types and text is sent to the proxy. It
 however works when the text cursor changes its position, so
 I therefore use a (hopefully temporary) hack, by starting a
 timer that triggers each second and moves the cursor. Since
 this is a nasty hack, it may have yet to be discovered side
 effects. If so, please let me know.
 */
class KeyboardViewController: KeyboardInputViewController {
    
    
    // MARK: - View Controller Lifecycle
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        /* iGold */
        FirebaseApp.configure()
        
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//
//    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardActionHandler = DemoKeyboardActionHandler(inputViewController: self)
        dialoger.keyboardViewController = self
        //setupKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        guard hasFullAccess else {
//            //return alert("You must enable full access to copy images.")
//            dialoger.addView(in: view)
//            return
//        }
        
//        if !hasFullAccess {
//            keyboardType = KeyboardType.alphabetic(uppercased: false)
//        }
        
        setupKeyboard()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupKeyboard(for: size)
    }
    
    
    // MARK: - Keyboard Functionality
    
    override func textDidChange(_ textInput: UITextInput?) {
        super.textDidChange(textInput)
        // requestAutocompleteSuggestions()
    }
    
    override func selectionWillChange(_ textInput: UITextInput?) {
        super.selectionWillChange(textInput)
        // autocompleteToolbar.reset()
    }
    
    override func selectionDidChange(_ textInput: UITextInput?) {
        super.selectionDidChange(textInput)
        // autocompleteToolbar.reset()
    }
    
    // MARK: - Public
    
    func openSettings() {
    
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        extensionContext?.open(url, completionHandler: { (success) in
            if !success {
                var responder = self as UIResponder?

                while (responder != nil){
                    let selectorOpenURL = NSSelectorFromString("openURL:")
                    if responder?.responds(to: selectorOpenURL) == true {
                        _ = responder?.perform(selectorOpenURL, with: url)
                    }
                    responder = responder?.next
                }
            }
        })
    }
    
    // MARK: - Properties
    
    let alerter = ToastAlert()
    let dialoger = ToastDialog()
    
    
    var keyboardType = KeyboardType.cat1_key {
        didSet { setupKeyboard() }
    }
    
   
    var tabButton: DemoButton?
    var keyBoardTypeCurrent: KeyboardType?
    var keyboardCollection : KeyboardButtonRowCollectionView?
    var labelCategory: UILabel?

    
    // MARK: - Autocomplete
    
    lazy var autocompleteProvider = DemoAutocompleteSuggestionProvider()
    
    lazy var autocompleteToolbar: AutocompleteToolbar = {
        AutocompleteToolbar(textDocumentProxy: textDocumentProxy)
    }()
}
