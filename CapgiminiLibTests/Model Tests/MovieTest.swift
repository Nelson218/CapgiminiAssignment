

import Foundation
import XCTest
@testable import CapgiminiLib

class MovieTest: XCTestCase {
    
    let movieJson: JSONDictionary = [
        "popularity": 3465.935,
        "vote_count": 53,
        "video": false,
        "poster_path": "/h8Rb9gBr48ODIwYUttZNYeMWeUU.jpg",
        "id": 635302,
        "adult": false,
        "backdrop_path": "/xoqr4dMbRJnzuhsWDF3XNHQwJ9x.jpg",
        "original_language": "ja",
        "original_title": "劇場版「鬼滅の刃」無限列車編",
        "genre_ids": [
            16,
            28,
            36,
            12,
            14,
            18
        ],
        "title": "Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train",
        "vote_average": 6.6,
        "overview": "Tanjirō Kamado, joined with Inosuke Hashibira, a boy raised by boars who wears a boar's head, and Zenitsu Agatsuma, a scared boy who reveals his true power when he sleeps, boards the Infinity Train on a new mission with the Fire Hashira, Kyōjurō Rengoku, to defeat a demon who has been tormenting the people and killing the demon slayers who oppose it!",
        "release_date": "2020-10-16"
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    func testMovie() {
        let movie: Movie = CoderHelper.decodeJson(json: movieJson)
        XCTAssertEqual(movie.averageVote, 6.6)
        XCTAssertEqual(movie.isTicketsAvlabile, false)
        XCTAssertEqual(movie.isUpcomingMovie, false)
        XCTAssertEqual(movie.popularity, 3465.935)
        XCTAssertEqual(movie.id, 635302)
        XCTAssertEqual(movie.logoURL, URL(string: "https://image.tmdb.org/t/p/w500/h8Rb9gBr48ODIwYUttZNYeMWeUU.jpg"))
        XCTAssertEqual(movie.title, "Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train")
    }
}
