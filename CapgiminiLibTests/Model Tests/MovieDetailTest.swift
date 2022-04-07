

import Foundation
import XCTest
@testable import CapgiminiLib

class MovieDetailTest: XCTestCase {
    
    let movieDetailJson: JSONDictionary = [
        "backdrop_path": "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg",
        "genres": [
            [
                "id": 28,
                "name": "Action"
            ],
            [
                "id": 53,
                "name": "Thriller"
            ]
        ],
        "overview": "The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist group kidnaps his daughter just to get it.",
        "release_date": "2020-10-23",
        "title": "Hard Kill",
    ]
    
    override class func setUp() {
        super.setUp()
    }
    
    func testMovieDetail() {
        let movie: MovieDetail = CoderHelper.decodeJson(json: movieDetailJson)
        XCTAssertEqual(movie.genre, "Action, Thriller")
        XCTAssertEqual(movie.logoURL, URL(string: "https://image.tmdb.org/t/p/w500/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg"))
        XCTAssertEqual(movie.overview, "The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist group kidnaps his daughter just to get it.")
    }
}
