//
//  KeyboardCollectionView.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-04-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This view can be used as a base class for a collection view
 that presents keyboard action buttons. You must subclass it,
 since it returns empty cells for each action.

 `KeyboardKit` has two built-in subclasses that you can use:
 `KeyboardButtonCollectionView` displays buttons in a single
 cell and `KeyboardButtonRowCollectionView` displays in rows.
 */
open class KeyboardCollectionView: UICollectionView, KeyboardStackViewComponent, UICollectionViewDataSource {
    // MARK: - Initialization

    public init(actions: [KeyboardAction]) {
        self.actions = actions
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        dataSource = self
        backgroundColor = .clear
        scrollsToTop = true
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }

    public required init?(coder aDecoder: NSCoder) {
        actions = []
        super.init(coder: aDecoder)
    }

    // MARK: - Properties

    public var actions: [KeyboardAction]

    public let cellIdentifier = "Cell"

    public var heightConstraint: NSLayoutConstraint?

    open func preRefresh() {
//        actions.removeAll()
//        collectionViewLayout.invalidateLayout()
//        reloadData()
    }

    // MARK: - Public Functions

    open func refresh() {
        collectionViewLayout.invalidateLayout()
        self.reloadData()
        setContentOffset(.zero, animated: false)
    }

    // MARK: - UICollectionViewDataSource

    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actions.count
    }

    
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.subviews.forEach { $0.removeFromSuperview() }
        return cell
    }
}
