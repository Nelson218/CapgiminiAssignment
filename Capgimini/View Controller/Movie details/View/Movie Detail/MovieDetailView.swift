

import UIKit
import CapgiminiLib
import Kingfisher

final class MovieDetailView: UIView, NibLoadable {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    
    public func prepare(movieDetail: MovieDetail) {
        logoImageView.kf.setImage(with: movieDetail.logoURL, placeholder: #imageLiteral(resourceName: "Placeholder"))
        titleLabel.text = movieDetail.title
        genreLabel.text = movieDetail.genre
    }
}

import SwiftUI
@available(iOS 13.0, *)
extension MovieDetailView: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let movieDetailView = MovieDetailView.fromNib
        movieDetailView.prepare(movieDetail: .default)
        
        return movieDetailView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

import SwiftUI
@available(iOS 13.0, *)
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView().previewLayout(.fixed(width: 375, height: 295))
    }
}
