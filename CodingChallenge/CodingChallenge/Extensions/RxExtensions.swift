//
//  RxExtensions.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {
    
    public var isAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            if active {
                ProgressHud.showHud()
            } else {
                ProgressHud.hideHud()
            }
        })
    }
    
    public var showError: Binder<String> {
        return Binder(self.base){ viewController, error in
            viewController.showAlert(title: "Error", message: error)
        }
    }
    
}



extension Reactive where Base: UIImageView {
    public var loadImage: Binder<URL?> {
        return Binder(self.base, binding: { (imageView, url) in
            guard let `url` = url else { return }
            imageView.loadImage(for: url)
        })
    }
}

