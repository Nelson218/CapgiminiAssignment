

import Foundation
import UIKit
import CapgiminiLib

public final class MovieCoordinator: BaseCoOrdinator {
    
    var rootViewController: UIViewController = UIViewController()

    public init() {
        let movieListViewController = MovieListViewController.fromStoryboard()
        let navController = UINavigationController(rootViewController: movieListViewController)
        navController.modalPresentationStyle = .fullScreen
        rootViewController = navController
        
        movieListViewController.movieSelected = movieSelected
    }
    
    private func movieSelected(movie: Movie) {
        let movieDetailCoordinator = MovieDetailCoordinator(movie: movie)
        
        if let navController = rootViewController as? UINavigationController {
            navController.pushViewController(movieDetailCoordinator.rootViewController, animated: true)
        }
    }
}
