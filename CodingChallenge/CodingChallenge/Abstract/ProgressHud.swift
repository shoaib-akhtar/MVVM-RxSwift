//
//  ProgressHud.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
import SBAProgressHud
class ProgressHud{
    static func showHud(title: String? = nil){
        DispatchQueue.main.async {
            SBAProgressHud.showHud(title: title)
        }
    }
    static func hideHud(){
        DispatchQueue.main.async {
            SBAProgressHud.hideHud()
        }
    }
}
