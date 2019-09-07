//
//  AlbumsViewTest.swift
//  CodingChallengeTests
//
//  Created by Shoaib Akhtar on 07/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import XCTest
import RxSwift
import RxDataSources
@testable import CodingChallenge

class AlbumsViewTest: XCTestCase {
    func test() {
        let tableVC = AlbumsTableVC()
        let viewModel = AlbumViewModel.init(dataHandler: AlbumViewModelUnitTestDataHandler(service: AlbumServiceUnitTest()))
        tableVC.viewModel = viewModel
        XCTAssertEqual(tableVC.tableView.numberOfSections, 0, "Expected zero section in table view before viewDidAppear")
        tableVC.viewDidAppear(true)
        XCTAssertEqual(tableVC.tableView.numberOfSections, 100, "Expected 100 sections in table view")
    }
}
