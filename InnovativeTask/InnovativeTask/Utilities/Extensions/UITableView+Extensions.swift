//
//  UITableView+Extensions.swift
//  InnovativeTask
//
//  Created by Muzamil Hassan on 25/01/2021.
//

import Foundation
import UIKit
extension UITableViewCell{
    static func identifier() -> String{
        return "\(self)"
    }
    
    
    static func nib() -> UINib{
        return UINib.init(nibName: "\(self)", bundle: nil)
    }
}
extension UITableView{
    
    func registerCell<T: UITableViewCell>(_: T.Type) {
        register(T.nib(), forCellReuseIdentifier: T.identifier())
    }
}
