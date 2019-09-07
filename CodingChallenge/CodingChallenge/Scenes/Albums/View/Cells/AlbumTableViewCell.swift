//
//  AlbumTableViewCell.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AlbumTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var albumImageView : UIImageView!
    @IBOutlet weak var albumTitle : UILabel!
    
    // MARK: Properties
    private var viewModel: AlbumTableViewCellViewModelType!
    private let disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        albumImageView.image = nil
    }
    
    // MARK: Configurations
    func configure(viewModel: AlbumTableViewCellViewModelType) {
        self.viewModel = viewModel
        bindViews()
    }
    
    // MARK: Layouting
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        albumImageView.layer.cornerRadius = 3
        albumImageView.clipsToBounds = true
    }
}

// MARK: Binding

private extension AlbumTableViewCell {
    func bindViews() {
        viewModel.outputs.title.bind(to: albumTitle.rx.text).disposed(by: disposeBag)
        viewModel.outputs.imageUrl.bind(to: albumImageView.rx.loadImage).disposed(by: disposeBag)
    }
}
