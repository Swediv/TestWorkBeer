//
//  UITableViewCell+Extension.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
