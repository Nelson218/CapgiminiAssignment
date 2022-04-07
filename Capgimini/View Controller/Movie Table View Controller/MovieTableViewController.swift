
import UIKit
import CapgiminiLib

public class MovieTableViewController: UIViewController {
    
    @IBOutlet internal var tableView: UITableView!
    internal var tableViewArray = [MovieViewProtocol]() {
        didSet {
            tableView.reloadData()
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = MovieViewType.allCases.compactMap {
            tableView.register(UINib(nibName: $0.nibName, bundle: nil), forCellReuseIdentifier: $0.resuseIdentifier)
        }

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.contentInset = .init(top: 20, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
    }
}

extension MovieTableViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = tableViewArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.movieType.resuseIdentifier, for: indexPath)
        
        if let cell = cell as? MovieTableViewCellProtocol {
            cell.prepare(movie: viewModel)
        }
        
        return cell
    }
}
