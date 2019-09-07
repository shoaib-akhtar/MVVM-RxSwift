//
//  UIViewController+Extensions.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import UIKit
extension UIViewController{
    func showAlert(title: String,message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "Ok", style: .cancel) { (action) in
            
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
