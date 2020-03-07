//
//  KeyboardViewController+Setup.swift
//  KeyboardKitDemoKeyboard
//
//  Created by Daniel Saidi on 2019-10-15.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import UIKit

extension KeyboardViewController {
    func setupKeyboard() {
        setupKeyboard(for: view.bounds.size)
    }

    func setupKeyboard(for size: CGSize) {
        DispatchQueue.main.async {
            self.setupKeyboardAsync(for: size)
        }
    }

    func setupKeyboardAsync(for size: CGSize) {
        keyboardStackView.removeAllArrangedSubviews()
        switch keyboardType {
        case let .alphabetic(uppercased): setupAlphabeticKeyboard(uppercased: uppercased)
        case .emojis: setupEmojiKeyboard(for: size)
        case .cat1_key: setupImageKeyboard(for: size, type: 1)
        case .cat2_key: setupImageKeyboard(for: size, type: 2)
        case .cat3_key: setupImageKeyboard(for: size, type: 3)
        case .cat4_key: setupImageKeyboard(for: size, type: 4)
        case .cat5_key: setupImageKeyboard(for: size, type: 5)
        case .numeric: setupNumericKeyboard()
        case .symbolic: setupSymbolicKeyboard()
        default: return
        }
    }

    func setupAlphabeticKeyboard(uppercased: Bool = false) {
        let keyboard = AlphabeticKeyboard(uppercased: uppercased, in: self)
        let rows = buttonRows(for: keyboard.actions, distribution: .fillProportionally)
        keyboardStackView.addArrangedSubviews(rows)
    }

    func setupEmojiKeyboard(for size: CGSize) {
        let keyboard = EmojiKeyboard(in: self)
        let isLandscape = size.width > 400
        let rowsPerPage = isLandscape ? 4 : 5
        let buttonsPerRow = isLandscape ? 10 : 8
        let config = KeyboardButtonRowCollectionView.Configuration(rowHeight: 40, rowsPerPage: rowsPerPage, buttonsPerRow: buttonsPerRow)
        let view = KeyboardButtonRowCollectionView(actions: keyboard.actions, configuration: config) { [unowned self] in self.button(for: $0) }
        
        let bottom = buttonRow(for: keyboard.bottomActions, distribution: .fillProportionally)
        keyboardStackView.addArrangedSubview(view)
        keyboardStackView.addArrangedSubview(bottom)
    }

    func setupImageKeyboard(for size: CGSize, type: Int) {
        let keyboard = ImageKeyboard(in: self)
        let isLandscape = size.width > 400
        let rowsPerPage = isLandscape ? 4 : 6
        let buttonsPerRow = isLandscape ? 11 : 9
        
        var actions: [KeyboardAction] = keyboard.actions
        if type == 1 {
            actions = keyboard.actionsCat1
        }
        if type == 2 {
            actions = keyboard.actionsCat2
        }
        if type == 3 {
            actions = keyboard.actionsCat3
        }
        if type == 4 {
            actions = keyboard.actionsCat4
        }
        if type == 5 {
            actions = keyboard.actionsCat5
        }
        
        let config = KeyboardButtonRowCollectionView.Configuration(rowHeight: 40, rowsPerPage: rowsPerPage, buttonsPerRow: buttonsPerRow)
        let view = KeyboardButtonRowCollectionView(actions: actions, configuration: config) { [unowned self] in
            self.button(for: $0)
            
        }
        
        let bottom = buttonRow(for: keyboard.bottomActions, distribution: .fillProportionally)
        //bottom.addBorder(.bottom, color: .black, thickness: 0.5)
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: 320, height: 50))
        label.text = "   AUNTIES & UNCLES"
        label.font = UIFont(name: "Helvetica-Bold", size: 14.0)
        label.textColor = .darkGray
        let labelUP = UILabel(frame: CGRect(x: 20, y: 10, width: 320, height: 50))
        labelUP.text = " "
        labelUP.font = UIFont(name: "Helvetica-Bold", size: 8.0)
        labelUP.textColor = .darkGray
        let labelDown = UILabel(frame: CGRect(x: 20, y: 10, width: 320, height: 50))
        labelDown.text = " "
        labelDown.font = UIFont(name: "Helvetica-Bold", size: 8.0)
        labelDown.textColor = .darkGray

        keyboardStackView.addArrangedSubview(labelUP)
        keyboardStackView.addArrangedSubview(label)
        keyboardStackView.addArrangedSubview(labelDown)
        self.keyboardCollection = view
        self.labelCategory = label
        keyboardStackView.addArrangedSubview(view)
        keyboardStackView.addArrangedSubview(bottom)
        
    }
    
    

    func setupNumericKeyboard() {
        let keyboard = NumericKeyboard(in: self)
        let rows = buttonRows(for: keyboard.actions, distribution: .fillProportionally)
        keyboardStackView.addArrangedSubviews(rows)
    }

    func setupSymbolicKeyboard() {
        let keyboard = SymbolicKeyboard(in: self)
        let rows = buttonRows(for: keyboard.actions, distribution: .fillProportionally)
        keyboardStackView.addArrangedSubviews(rows)
    }
}
extension UIView {
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        self.addSubview(subview)
        switch edge {
        case .top, .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .top {
                subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            } else {
                subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            }
        case .left, .right:
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            subview.widthAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .left {
                subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            } else {
                subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            }
        default:
            break
        }
    }
}
