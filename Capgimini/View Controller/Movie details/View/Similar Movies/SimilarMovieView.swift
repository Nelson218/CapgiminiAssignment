

import Foundation
import CapgiminiLib
import UIKit

final class SimilarMovieView: UIView, NibLoadable {
    
    @IBOutlet private weak var mainCollectionView: UICollectionView!
    
    internal var movieSelected: ((Movie) -> Void) = { _ in }
    private let reuseIdentifier = "SimilarMovieCollectionViewCell"
    private var movies = [Movie]()
    
    override func awakeFromNib() {
        mainCollectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        super.awakeFromNib()
    }
    
    public func prepare(movies: [Movie]) {
        self.movies = movies
        mainCollectionView.reloadData()
    }
}

extension SimilarMovieView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SimilarMovieCollectionViewCell
        cell.prepare(movie: movies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieSelected(movies[indexPath.row])
    }
}
