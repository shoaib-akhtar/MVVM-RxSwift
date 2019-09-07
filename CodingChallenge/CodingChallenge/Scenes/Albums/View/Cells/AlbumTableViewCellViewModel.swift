//
//  AlbumTableViewCellViewModel.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
import RxSwift

protocol AlbumTableViewCellViewModelInput {
    
}

protocol AlbumTableViewCellViewModelOutput {
    var imageUrl: Observable<URL?> { get }
    var title: Observable<String?> { get }
}

protocol AlbumTableViewCellViewModelType {
    var inputs: AlbumTableViewCellViewModelInput { get }
    var outputs: AlbumTableViewCellViewModelOutput { get }
    var reuseIdentifier: String { get }
}

class AlbumTableViewCellViewModel: AlbumTableViewCellViewModelType, AlbumTableViewCellViewModelInput, AlbumTableViewCellViewModelOutput {
    
    // MARK: - Properties
    var inputs: AlbumTableViewCellViewModelInput { return self }
    var outputs: AlbumTableViewCellViewModelOutput { return self }
    var reuseIdentifier: String { return AlbumTableViewCell.reuseIdentifier }
    
    var imageUrlSubject = BehaviorSubject<URL?> (value: nil)
    var titleSubject = BehaviorSubject<String?> (value: nil)
    
    let disposeBag = DisposeBag()
    let album: Album!
    
    // MARK: - Outputs
    var imageUrl: Observable<URL?> { return imageUrlSubject.asObservable() }
    var title: Observable<String?> { return titleSubject.asObservable() }
    
    // MARK: - Init
    init(album: Album) {
        self.album = album
        imageUrlSubject.onNext(album.thumbnailUrl)
        titleSubject.onNext(album.title)
    }
}

