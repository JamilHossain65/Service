//
//  CollectionView.swift
//  Service
//
//  Created by Hamza on 11/11/2022.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    func registerNib(cell: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: cell.ReuseId, bundle: bundle), forCellWithReuseIdentifier: cell.ReuseId)
    }
    
    func register(header: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: header.ReuseId, bundle: bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: header.ReuseId)
    }
    
    func register(footer: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: footer.ReuseId, bundle: bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: footer.ReuseId)
    }

    func registerCells(cells: [ReusableCell.Type], in bundle: Bundle? = nil) {

        cells.forEach { registerNib(cell: $0) }
    }

    func dequeueReusableCell<T: ReusableCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.ReuseId, for: indexPath ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: ReusableCell>(ofKind kind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.ReuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
}

import Foundation
@objc public protocol ReusableView { }

extension ReusableView {

    public static var ReuseId: String {
        return String(describing: self)
    }

    public static var NibName: String {
        return String(describing: self)
    }
}

@objc public protocol ReusableCell: ReusableView { }
