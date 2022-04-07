

import Foundation
import CapgiminiLib

public enum MovieViewType: Int, CaseIterable {
    case detailed
    case searched
    
    var resuseIdentifier: String {
        switch self {
        case .detailed: return "movieCellIdentifier"
        case .searched: return "searchCellIdentifier"
        }
    }
    
    var nibName: String {
        switch self {
        case .detailed: return "MovieTableViewCell"
        case .searched: return "SearchedTableViewCell"
        }
    }
}

protocol MovieViewProtocol {
    var title: String { get }
    var movie: Movie { get }
    var movieType: MovieViewType { get }
}

protocol MovieTableViewCellProtocol {
    func prepare(movie: MovieViewProtocol)
}
