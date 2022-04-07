

import UIKit
import CapgiminiLib
import Kingfisher

final class MovieTableViewCell: UITableViewCell, MovieTableViewCellProtocol, NibLoadable {
    
    @IBOutlet private var logoImageView: UIImageView!
    private var movie: Movie?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        logoImageView.setRadius(radius: 10)
    }

    public func prepare(movie: MovieViewProtocol) {
        
        guard let movieViewModel = movie as? MovieViewModel else { return }
        
        self.movie = movieViewModel.movie
        self.logoImageView.kf.setImage(with: movieViewModel.logoImageURL, placeholder: #imageLiteral(resourceName: "Placeholder"))
    }
}

import SwiftUI
@available(iOS 13.0, *)
extension MovieTableViewCell: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let movieTableViewCell = MovieTableViewCell.fromNib
        movieTableViewCell.prepare(movie: MovieViewModel(movie: .defalut))
        
        return movieTableViewCell
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

import SwiftUI
@available(iOS 13.0, *)
struct MovieTableViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieTableViewCell().previewLayout(.fixed(width: 375, height: 200))
    }
}
