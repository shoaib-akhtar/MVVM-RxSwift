//
//  AlbumViewModelUnitTest.swift
//  CodingChallengeTests
//
//  Created by Shoaib Akhtar on 07/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//
import XCTest
@testable import CodingChallenge


class AlbumViewModelUnitTest: XCTestCase {
    let viewModel = AlbumViewModel.init(dataHandler: AlbumViewModelUnitTestDataHandler(service: AlbumServiceUnitTest()))
    func test() {
        viewModel.inputs.viewAppearedObserver.onNext(())
    }
}
