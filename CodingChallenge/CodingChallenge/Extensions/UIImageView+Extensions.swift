//
//  UIImageView+Extensions.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIImageView{
    func loadImage(for url: URL) {
        AppAsyncImage().loadImage(for: url, in: self)
    }
}

