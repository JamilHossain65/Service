//
//  TableViewCell.swift
//  WallsPy
//
//  Created by Daniyal Shafiq on 20/04/2022.
//  Copyright © 2022 367 Labs. All rights reserved.
//

import Foundation

import UIKit
class TableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

func creatTable() -> UITableView{
    let  tv = UITableView()
    tv.showsVerticalScrollIndicator = false
    tv.backgroundColor = .clear
    tv.clipsToBounds = true
    tv.separatorStyle = .none
    tv.isUserInteractionEnabled = true
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
}

