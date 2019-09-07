//
//  AppAsynImage.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
import Kingfisher

struct AppAsyncImage {
    
    func loadImage(for url: URL, in view:UIImageView) {
        view.kf.indicatorType = .activity
        view.kf.setImage(with: url)
    }
    
    func prefetchImages(for urls:[URL],requireAuthentication: Bool = true){
        let options : KingfisherOptionsInfo? = []
        let prefetcher = ImagePrefetcher(urls: urls, options: options) {
            skippedResources, failedResources, completedResources in
        }
        prefetcher.start()
    }
    
}
