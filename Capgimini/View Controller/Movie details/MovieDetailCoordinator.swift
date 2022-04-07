

import Foundation
import UIKit
import CapgiminiLib

public final class MovieDetailCoordinator: BaseCoOrdinator {
    
    var rootViewController: UIViewController = UIViewController()
    
    private func createMovieDetailViewController(forMovie movie: Movie) -> UIViewController {
        let movieDetailViewController = MovieDetailViewController.fromStoryboard()
        movieDetailViewController.movie = movie
        
        return movieDetailViewController
    }

    internal init(movie: Movie) {
        rootViewController = createMovieDetailViewController(forMovie: movie)
    }
}
