

import UIKit
import CapgiminiLib
import Kingfisher

final class SimilarMovieCollectionViewCell: UICollectionViewCell, NibLoadable {

    @IBOutlet private weak var innerView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        innerView.setBorder(width: 1)
        innerView.setRadius(radius: 5)
        super.awakeFromNib()
    }

    public func prepare(movie: Movie) {
        logoImageView.kf.setImage(with: movie.logoURL, placeholder: #imageLiteral(resourceName: "Placeholder"))
        titleLabel.text = movie.title
    }
}

import SwiftUI
@available(iOS 13.0, *)
extension SimilarMovieCollectionViewCell: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let movieDetailView = SimilarMovieCollectionViewCell.fromNib
        movieDetailView.prepare(movie: .defalut)
        
        return movieDetailView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

import SwiftUI
@available(iOS 13.0, *)
struct SimilarMovieCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        SimilarMovieCollectionViewCell().previewLayout(.fixed(width: 200, height: 300))
    }
}
