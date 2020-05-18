//
//  ViewController.swift
//  KeyboardKitDemo
//
//  Created by Daniel Saidi on 2019-10-01.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func instaTapped(_ sender: Any) {
        if let url = URL(string: "https://instagram.com/communiji?igshid=1h7ahm2r1iqd") {
            UIApplication.shared.open(url)
        }
        
    }
    @IBAction func fbTapped(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com/Communiji-101834561512764") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func linkedTapped(_ sender: Any) {
        if let url = URL(string: "https://www.linkedin.com/company/communiji") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func installKeyboardTapped(_ sender: Any) {
       if let url = NSURL(string: UIApplication.openSettingsURLString) as URL? {    
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
//        if let url = NSURL(string: "App-prefs:root=General&path=Keyboard") as URL? {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
     
    }
    @IBOutlet weak var textView: UITextView? {
        didSet { textView?.contentInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0) }
    }
}
