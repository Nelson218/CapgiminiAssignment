

import UIKit
import CapgiminiLib
import Kingfisher

final class MovieTableViewCell: UITableViewCell, MovieTableViewCellProtocol {
    
    @IBOutlet private var innerContentView: UIView!
    @IBOutlet private var titleLable: UILabel!
    @IBOutlet private var likeLabel: UILabel!
    @IBOutlet private var lovedLabel: UILabel!
    @IBOutlet private var releasedDateLabel: UILabel!
    @IBOutlet private var logoImageView: UIImageView!
    @IBOutlet private var bookButton: UIButton!
    private var movie: Movie?
    private var ctaClicked: ((Movie) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        bookButton.setRadius(radius: 5)
        innerContentView.setRadius(radius: 10)
        logoImageView.setRadius(radius: 10)
    }

    public func prepare(movie: MovieViewProtocol) {
        
        guard let movieViewModel = movie as? MovieViewModel else { return }
        
        self.movie = movieViewModel.movie
        self.titleLable.text = movieViewModel.title
        self.likeLabel.text = movieViewModel.likeText
        self.lovedLabel.text = movieViewModel.loveText
        self.releasedDateLabel.text = movieViewModel.releasedDate
        self.logoImageView.kf.setImage(with: movieViewModel.logoImageURL, placeholder: #imageLiteral(resourceName: "Placeholder"))
        self.bookButton.setTitle(movieViewModel.ctaTitle, for: .normal)
        self.bookButton.isEnabled = movieViewModel.isCtaEnable
        self.ctaClicked = movieViewModel.onButtonClick
    }
}

extension MovieTableViewCell {
    @IBAction private func buttonClicked() {
        if let movie = movie {
            ctaClicked?(movie)
        }
    }
}

extension MovieTableViewCell: NibLoadable {
    
}

import SwiftUI
@available(iOS 13.0, *)
extension MovieTableViewCell: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let movieTableViewCell = MovieTableViewCell.fromNib
        movieTableViewCell.prepare(movie: MovieViewModel(movie: .defalut, onButtonClick: nil))
        
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
