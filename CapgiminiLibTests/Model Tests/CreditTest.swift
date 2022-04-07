

import Foundation
import XCTest
@testable import CapgiminiLib

class CreditTest: XCTestCase {
    
    let creditJson: JSONDictionary = [
        "id": 531219,
        "cast": [
            [
                "cast_id": 12,
                "character": "Grand High Witch",
                "credit_id": "5c3fb2dc9251417ba0ab8917",
                "gender": 1,
                "id": 1813,
                "name": "Anne Hathaway",
                "order": 0,
                "profile_path": "/tLelKoPNiyJCSEtQTz1FGv4TLGc.jpg"
            ]
        ],
        "crew": [
            [
                "credit_id": "5b2ac179c3a3683df9001a21",
                "department": "Directing",
                "gender": 2,
                "id": 37,
                "job": "Original Music Composer",
                "name": "Alan Silvestri",
                "profile_path": "/pQOAsQDuYMR4cKaPAP0wkRlCSNo.jpg"
            ],
            [
                "credit_id": "5b29dc290e0a265fe0002a7c",
                "department": "Writing",
                "gender": 2,
                "id": 24,
                "job": "Screenplay",
                "name": "Robert Zemeckis",
                "profile_path": "/4tWfclPQ3WAUwotZl2hIneQwWXR.jpg"
            ],
            [
                "credit_id": "5b29dc20925141390b0018ee",
                "department": "Directing",
                "gender": 2,
                "id": 24,
                "job": "Director",
                "name": "Robert Zemeckis",
                "profile_path": "/4tWfclPQ3WAUwotZl2hIneQwWXR.jpg"
            ]
        ]
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    func testReviewDetail() throws {
        let credits: Credits = CoderHelper.decodeJson(json: creditJson)
        XCTAssertEqual(credits.cast.count, 1)
        XCTAssertEqual(credits.crew.count, 3)
        
        if let cast = credits.cast.first {
            testCast(cast: cast)
        } else {
            XCTFail("There are no element in cast")
            throw UnexpectedNilError()
        }
        
        let directingDepartment = credits.crew.filter { $0.department == .directing }
        XCTAssertEqual(directingDepartment.count, 2)
        
        if let crew = credits.crew.first {
            testCrew(crew: crew)
        } else {
            XCTFail("There are no element in crew")
            throw UnexpectedNilError()
        }
    }
    
    private func testCast(cast: Cast) {
        XCTAssertEqual(cast.character, "Grand High Witch")
        XCTAssertEqual(cast.name, "Anne Hathaway")
    }
    
    private func testCrew(crew: Crew) {
        XCTAssertEqual(crew.job, "Original Music Composer")
        XCTAssertEqual(crew.department, .directing)
        XCTAssertEqual(crew.name, "Alan Silvestri")
    }
}
