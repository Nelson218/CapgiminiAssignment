

import UIKit
import CapgiminiLib

final class MovieDetailViewController: UIViewController, StoryboardLoadable {

    @IBOutlet private var vStackView: UIStackView!
    @IBOutlet private var loaderView: UIActivityIndicatorView!
    internal var similarMovieclicked: ((Movie) -> Void) = { _ in }
    internal var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = movie.title
        fetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func fetch() {
        loaderView.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            MovieDetailServiceHelper.start(movie: self.movie, onFinish: { [weak self] (movieDetail, credit, review, similarMovie) in
                guard let `self` = self else { return }
                
                self.loaderView.stopAnimating()
                self.loaderView.isHidden = true
                
                if let movieDetail = movieDetail {
                    self.showMovieDetail(movieDetail: movieDetail)
                }
                if let credits = credit {
                    self.showCredit(credit: credits)
                }
                if let reviewResult = review {
                    self.showReview(reviews: reviewResult)
                }
                if let similarMovie = similarMovie {
                    self.showSimilarMovie(movies: similarMovie.results)
                }
            })
        }
    }
    
    private func showMovieDetail(movieDetail: MovieDetail) {
        let insertViewAt = 0
        let movieDetailView = MovieDetailView.fromNib
        movieDetailView.prepare(movieDetail: movieDetail)
        
        vStackView.insertArrangedSubview(movieDetailView, at: insertViewAt)
    }
    
    private func showCredit(credit: Credits) {
        let insertViewAt = 1
        let creditView = CreditsView.fromNib
        creditView.prepare(credit: credit) { [weak self] in
            guard let `self` = self else { return }
            if self.vStackView.arrangedSubviews.count >= insertViewAt {
                self.vStackView.insertArrangedSubview(creditView, at: insertViewAt)
            } else {
                self.vStackView.addArrangedSubview(creditView)
            }
        }
    }
    
    private func showSimilarMovie(movies: [Movie]) {
        if movies.count > 0 {
            let similarMovieView = SimilarMovieView.fromNib
            similarMovieView.prepare(movies: movies)
            similarMovieView.movieSelected = similarMovieclicked
            
            vStackView.addArrangedSubview(similarMovieView)
        }
    }
    
    private func showReview(reviews: ReviewResult) {
        let insertViewAt = 2
        if reviews.results.count > 0 {
            let creditView = CreditsView.fromNib
            creditView.prepare(reviews: reviews.results)
            
            if vStackView.arrangedSubviews.count >= insertViewAt {
                vStackView.insertArrangedSubview(creditView, at: insertViewAt)
            } else {
                vStackView.addArrangedSubview(creditView)
            }
        }
    }
}
