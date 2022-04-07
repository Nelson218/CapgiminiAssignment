
import UIKit
import CapgiminiLib

final class CastCrewView: UIView, NibLoadable {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    public func prepare(castCrew: CastCrewDetail) {
        titleLabel.text = castCrew.name
        detailLabel.attributedText = castCrew.nameDetail
    }
    
    public func prepare(review: Review) {
        titleLabel.text = review.author
        detailLabel.text = review.content
        detailLabel.numberOfLines = 3
    }
}

import SwiftUI
@available(iOS 13.0, *)
extension CastCrewView: UIViewRepresentable {
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let castCrewView = CastCrewView.fromNib
        castCrewView.prepare(review: .default)
        
        return castCrewView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

import SwiftUI
@available(iOS 13.0, *)
struct CastCrewView_Previews: PreviewProvider {
    static var previews: some View {
        CastCrewView().previewLayout(.fixed(width: 375, height: 80))
    }
}
