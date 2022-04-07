

import UIKit
import CapgiminiLib

public struct MovieViewModel: MovieViewProtocol {
    public private(set) var likeText: String
    public private(set) var loveText: String
    public private(set) var releasedDate: String
    public private(set) var ctaTitle: String
    public private(set) var logoImageURL: URL?
    public private(set) var isCtaEnable: Bool
    public private(set) var movie: Movie
    public private(set) var title: String
    public private(set) var movieType: MovieViewType = .detailed
    public var onButtonClick: ((Movie) -> Void)?

    public init(movie: Movie, onButtonClick: ((Movie) -> Void)?) {
        self.movie = movie
        self.title = movie.title
        self.likeText = "\(movie.averageVote) / 10"
        self.loveText = "Loved by \(Int(movie.popularity))"
        self.releasedDate = movie.isUpcomingMovie ? "Will release on " : "Released on " + movie.releasedOn
        self.logoImageURL = movie.logoURL
        self.ctaTitle = movie.isTicketsAvlabile ? "Book" : "N/A"
        self.isCtaEnable = movie.isTicketsAvlabile
        self.onButtonClick = onButtonClick
    }
}
