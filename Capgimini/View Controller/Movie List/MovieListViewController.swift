
import UIKit
import CapgiminiLib

final class MovieListViewController: MovieTableViewController, StoryboardLoadable, UIViewControllerFetchProtocol {
    
    @IBOutlet private var searchBar: UISearchBar!
    
    internal var movieSelected: ((Movie) -> Void) = { _  in }
    internal var searchBarTapped: (([Movie]) -> Void) = { _  in }
    private var isLoadingList = false
    private var currentPageNumber = 1
    private var reachedAtTheEndOfData = false
    private var moviesArray = [Movie]() {
        didSet {
            tableViewArray = moviesArray.map {
                MovieViewModel(movie: $0, onButtonClick: self.movieSelected)
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
        guard !isLoadingList, !reachedAtTheEndOfData else { return }
        
        showLoadingIndicator()
        isLoadingList = true
        
        Movies.fetch(forPage: currentPageNumber) { [weak self] (movies) in
            guard let `self` = self else { return }
            self.onReciveResponse(movies: movies)
        } failure: { [weak self] (error) in
            guard let `self` = self else { return }
            self.hideLoadingIndicator()
            self.isLoadingList = false
            self.showError(errorConfig: error)
        }
    }
    
    private func onReciveResponse(movies: Movies) {
        hideLoadingIndicator()
        moviesArray.append(contentsOf: movies.results)
        currentPageNumber = movies.page + 1
        tableView.reloadData()
        reachedAtTheEndOfData = currentPageNumber > movies.total_pages
        isLoadingList = false
    }
}

extension MovieListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == tableViewArray.count - 1 {
            fetch()
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
}

extension MovieListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarTapped(moviesArray)
        searchBar.resignFirstResponder()
    }
}
