

import Foundation
import XCTest
@testable import CapgiminiLib

class ReviewTest: XCTestCase {
    
    let reviewJson: JSONDictionary = [
        "author": "TinyLilRobot",
        "content": "A lot was changed in this remake and I thought it would irk me.",
        "id": "5f9befe390ea4b00397d9b3b",
        "url": "https://www.themoviedb.org/review/5f9befe390ea4b00397d9b3b"
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    func testReviewDetail() {
        let review: Review = CoderHelper.decodeJson(json: reviewJson)
        XCTAssertEqual(review.author, "TinyLilRobot")
        XCTAssertEqual(review.content, "A lot was changed in this remake and I thought it would irk me.")
    }
}
