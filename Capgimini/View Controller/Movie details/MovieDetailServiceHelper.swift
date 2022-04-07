

import Foundation
import CapgiminiLib

internal final class MovieDetailServiceHelper {
    internal static func start(movie: Movie, onFinish: @escaping ((MovieDetail?, Credits?, ReviewResult?, Movies?) -> Void)) {
        
        let dispatchGroup = DispatchGroup()
        var movieDetail: MovieDetail?
        var credit: Credits?
        var similarMovie: Movies?
        var review: ReviewResult?
        
        dispatchGroup.enter()
        MovieDetail.fetch(forMovieID: movie.id, completionHandler: { (detail) in
            movieDetail = detail
            dispatchGroup.leave()
        }) { (errorConfig) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Credits.fetch(forMovieID: movie.id, completionHandler: { (credits) in
            credit = credits
            dispatchGroup.leave()
        }) { (errorConfig) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Movies.fetchForSimilarMovie(forMovieID: movie.id, completionHandler: { (result) in
            similarMovie = result
            dispatchGroup.leave()
        }) { (erroConfig) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        ReviewResult.fetch(forMovieID: movie.id, completionHandler: { (result) in
            review = result
            dispatchGroup.leave()
        }) { (errorConfig) in
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            onFinish(movieDetail, credit, review, similarMovie)
        }
    }
}
