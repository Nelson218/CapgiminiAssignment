

import Foundation
import CapgiminiLib

public enum MovieViewType: Int, CaseIterable {
    case detailed
    
    var resuseIdentifier: String {
        switch self {
        case .detailed: return "movieCellIdentifier"
        }
    }
    
    var nibName: String {
        switch self {
        case .detailed: return "MovieTableViewCell"
        }
    }
}

protocol MovieViewProtocol {
    var movie: Movie { get }
    var movieType: MovieViewType { get }
}

protocol MovieTableViewCellProtocol {
    func prepare(movie: MovieViewProtocol)
}
