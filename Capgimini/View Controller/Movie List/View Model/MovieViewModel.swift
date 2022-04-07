

import UIKit
import CapgiminiLib

public struct MovieViewModel: MovieViewProtocol {
    var movieType: MovieViewType = .detailed
    
    public private(set) var logoImageURL: URL?
    public private(set) var movie: Movie

    public init(movie: Movie) {
        self.movie = movie
        self.logoImageURL = movie.logoURL
    }
}
