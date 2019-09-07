//
//  Data+Extensions.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
extension Data{
    func deserialized<T: Codable>() -> T? {
        do {
            let object = try JSONDecoder().decode(T.self, from: self)
            return object
        } catch {
            return nil
        }
    }
}
