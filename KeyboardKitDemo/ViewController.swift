//
//  ViewController.swift
//  KeyboardKitDemo
//
//  Created by Daniel Saidi on 2019-10-01.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func instaTapped(_ sender: Any) {
        if let url = URL(string: "https://www.instagram.com") {
            UIApplication.shared.open(url)
        }
        
    }
    @IBAction func fbTapped(_ sender: Any) {
        if let url = URL(string: "https://www.facebook.com") {
            UIApplication.shared.open(url)
        }
    }
    @IBOutlet weak var textView: UITextView? {
        didSet { textView?.contentInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0) }
    }
}
