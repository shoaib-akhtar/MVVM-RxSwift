//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class AlbumsTableVC: UITableViewController {
 
    // MARK: Properties
    var viewModel: AlbumViewModelType = AlbumViewModel(dataHandler: DataHandler(service: AlbumService()))
    private let disposeBag = DisposeBag()
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<Int, AlbumTableViewCellViewModelType>>!
    
    
    // MARK: View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = nil
        tableView.dataSource = nil
        
        setupViews()
        bindTableView()
        bindViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.inputs.viewAppearedObserver.onNext(())
    }
}

// MARK: View setup

private extension AlbumsTableVC {
    func setupViews() {
        tableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: AlbumTableViewCell.reuseIdentifier)
    }
}


// MARK: Binding

private extension AlbumsTableVC {
    func bindTableView() {
        dataSource = RxTableViewSectionedReloadDataSource(configureCell: { (sf, tableView, indexPath, viewModel) in
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier) as! AlbumTableViewCell
            cell.configure(viewModel: viewModel)
            return cell
        })
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return String(dataSource.sectionModels[index].model)
        }
        
        viewModel.outputs.dataSource.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
    
    func bindViews() {
        viewModel.outputs.showActivity.bind(to: rx.isAnimating).disposed(by: disposeBag)
        viewModel.outputs.error.map{ $0.errorMessage }.bind(to: rx.showError).disposed(by: disposeBag)
    }
}
