//
//  AlbumViewModel.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

protocol AlbumViewModelInput {
    var viewAppearedObserver: AnyObserver<Void> { get }
}

protocol AlbumViewModelOutput {
    var showActivity: Observable<Bool> { get }
    var dataSource: Observable<[SectionModel<Int, AlbumTableViewCellViewModelType>]> { get }
    var error: Observable<AlbumViewModel.AlbumEror> { get }
}

protocol AlbumViewModelType {
    var inputs: AlbumViewModelInput { get }
    var outputs: AlbumViewModelOutput { get }
}


class AlbumViewModel: AlbumViewModelType, AlbumViewModelInput, AlbumViewModelOutput {
    
    
    // MARK: Properties
    var inputs: AlbumViewModelInput { return self }
    var outputs: AlbumViewModelOutput { return self }
    
    private let showActivitySubject = BehaviorSubject<Bool>(value: false)
    private let dataSourceSubject = BehaviorSubject<[SectionModel<Int, AlbumTableViewCellViewModelType>]>(value: [])
    private let viewAppearedSubject = PublishSubject<Void>()
    private let errrorSubject = PublishSubject<AlbumViewModel.AlbumEror>()
    private let albumsSubject = PublishSubject<[Album]>()
    
    private let disposeBag = DisposeBag()
    private let dataHandler : DataHandler
    
    // MARK: Inputs
    var viewAppearedObserver: AnyObserver<Void> { return viewAppearedSubject.asObserver() }
    
    // MARK: Outputs
    var showActivity: Observable<Bool> { return showActivitySubject.asObservable() }
    var dataSource: Observable<[SectionModel<Int, AlbumTableViewCellViewModelType>]> { return dataSourceSubject.asObservable() }
    var error: Observable<AlbumViewModel.AlbumEror> { return errrorSubject.asObservable() }
    
    init(dataHandler: DataHandler) {
        self.dataHandler = dataHandler
        viewAppearedSubject
            .subscribe(onNext: { [weak self] in
                guard let self = self else {return}
                self.showActivitySubject.onNext(true)
                self.dataHandler.getAndSaveDataInDb { [weak self] (result) in
                    guard let self = self else {return}
                    self.showActivitySubject.onNext(false)
                    switch result {
                    case .success(let albums):
                        self.albumsSubject.onNext(albums)
                        
                    case .failure:
                        self.errrorSubject.onNext(.somethingWentWrong("Something went wrong please try again later."))
                    }
                }
            })
            .disposed(by: disposeBag)
        
        albumsSubject
            .map { $0.map{ AlbumTableViewCellViewModel(album: $0) } }
            .map{ cellViewModels in
                Dictionary(grouping: cellViewModels, by: { cellViewModel in cellViewModel.album.albumId })
            }
            .map{ group in
                group.sorted { lhs, rhs in
                    return lhs.key < rhs.key
                }
            }
            .map{ group in
                group.map { SectionModel(model: $0.key, items: $0.value)}
            }
            .bind(to: dataSourceSubject)
            .disposed(by: disposeBag)
    }
}

// MARK: Errors

extension AlbumViewModel {
    public enum AlbumEror {
        case somethingWentWrong(String)
    }
}

extension AlbumViewModel.AlbumEror {
    var errorMessage: String {
        switch self {
        case .somethingWentWrong(let error):
            return error
        }
    }
}
