//
//  ToastDialog.swift
//  KeyboardKitDemoKeyboard
//
//  Created by iGold on 3/31/20.
//

import Foundation

import UIKit

/**
 This class presents message alerts as toasts, at the center
 of a keyboard extension's view.
 
 `TODO:` This alerter should be refactored to use appearance
 proxies, e.g. combined with theme classes.
*/
open class ToastDialog: KeyboardDialog, CustomViewDelegate {
    
    
    // MARK: - Initialization
    
    public init(appearance: Appearance = Appearance()) {
        self.appearance = appearance
    }
    
    
    // MARK: - Public Properties
    
    public let appearance: Appearance
    
    
    // MARK: - Types
    
    public class Label: UILabel {}
    
    public class View: UIView {}
    
    public struct Appearance {
        public init() {}
        public var backgroundColor: UIColor = .white
        public var cornerRadius: CGFloat = 0
        public var font: UIFont = .systemFont(ofSize: 10)
        public var textColor: UIColor = .black
//        public var horizontalPadding: CGFloat = 20
      
//        public var verticalOffset: CGFloat = 0
//        public var verticalPadding: CGFloat = 10
    }
    
    
    // MARK: - Public functions
//    let container : UIView
    
    
    open func addView(in view: UIView) {
        
        //let container = createContainerView(in: view)
        
        let container = CustomView(frame: view.frame)
        //container.delegate = self;
        
        view.addSubview(container)
 
        
        //unpresent(container, withDuration: 3)
    }
    
//    open func alert(message: String, in view: UIView, withDuration duration: Double) {
//        let label = createLabel(withText: message)
//        let container = createContainerView(for: label, in: view)
//        unpresent(container, withDuration: duration)
//    }
    
    open func style(_ view: View) {}
    
    open func style(_ label: Label) {}
    
    open func unpresent(_ view: View, withDuration duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            view.alpha = 0
        }, completion: { _ in
            view.removeFromSuperview()
        })
    }
    
    public func openSettings() {
        
    }
}


// MARK: - Private Functions

private extension ToastDialog {

    func createContainerView(in view: UIView) -> View {
        
        let container = View(frame: view.frame)
        view.addSubview(container)
        container.backgroundColor = appearance.backgroundColor

        container.center = view.center
        
        let label1 = createLabel(withText: "Full Access is Disabled");
        let label2 = createLabel(withText: "Go to iOS Settings->Communiji");
        
        container.addSubview(label1)
        container.addSubview(label2)
        
        
        
        container.applyShadow(.standardButtonShadow)

        style(container)
        return container
    }
    
    func createLabel(withText text: String) -> Label {
        let label = Label()
        label.text = text
        label.numberOfLines = 0
        label.font = appearance.font
        label.textColor = appearance.textColor
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.sizeToFit()
        style(label)
        label.autoresizingMask = .centerInParent
        return label
    }
    
//    func placeContainerView(_ container: UIView, in view: UIView) {
//        container.autoresizingMask = .centerInParent
//        let dx = -appearance.horizontalPadding
//        let dy = -appearance.verticalPadding
//        container.frame = container.frame.insetBy(dx: dx, dy: dy)
//    }
}

