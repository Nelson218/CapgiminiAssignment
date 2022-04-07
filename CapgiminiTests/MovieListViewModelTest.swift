//
//  MovieListViewModelTest.swift
//  CapgiminiTests
//
//  Created by Nelson Thomas Pereira on 07/04/22.
//

import Foundation
import XCTest
@testable import Capgimini

final class MovieListViewModelTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testListViewModel() {
        let movieModel = MovieViewModel(movie: .defalut)
        XCTAssertEqual(movieModel.logoImageURL, URL(string: "https://image.tmdb.org/t/p/w500/h8Rb9gBr48ODIwYUttZNYeMWeUU.jpg"))
    }
}
