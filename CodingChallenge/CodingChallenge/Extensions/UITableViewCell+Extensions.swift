//
//  UITableViewCell+Extensions.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String.init(describing: self)
    }
}
