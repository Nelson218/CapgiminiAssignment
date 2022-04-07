
import UIKit
import CapgiminiLib

final class MovieListViewController: MovieTableViewController, StoryboardLoadable, UIViewControllerFetchProtocol {
        
    internal var movieSelected: ((Movie) -> Void) = { _  in }
    private var moviesArray = [Movie]() {
        didSet {
            tableViewArray = moviesArray.map {
                MovieViewModel(movie: $0)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func fetch() {
        
        showLoadingIndicator()
        Movies.fetch(completionHandler: { [weak self] (movies) in
            guard let `self` = self else { return }
            self.onReciveResponse(movies: movies)
        }) { [weak self] (error) in
            guard let `self` = self else { return }
            self.hideLoadingIndicator()
            self.showError(errorConfig: error)
        }
    }
    
    private func onReciveResponse(movies: Movies) {
        hideLoadingIndicator()
        moviesArray.append(contentsOf: movies.results)
        tableView.reloadData()
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieSelected(moviesArray[indexPath.row])
    }
}
